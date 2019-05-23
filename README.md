### dygraphs for R

The dygraphs package is an R interface to the [dygraphs](http://dygraphs.com) JavaScript charting library. It provides rich facilites for charting time-series data in R, including:

- Automatically plots [xts](http://cran.rstudio.com/web/packages/xts/index.html) time series objects (or any object convertible to xts).
- Highly configurable axis and series display (including optional second Y-axis).
- Rich interactive features including [zoom/pan](https://rstudio.github.io/dygraphs/gallery-range-selector.html) and series/point [highlighting](https://rstudio.github.io/dygraphs/gallery-series-highlighting.html).
- Display [upper/lower bars](https://rstudio.github.io/dygraphs/gallery-upper-lower-bars.html) (e.g. prediction intervals) around series.
- Various graph overlays including [shaded regions](https://rstudio.github.io/dygraphs/gallery-shaded-regions.html), [event lines](https://rstudio.github.io/dygraphs/gallery-event-lines.html), and point [annotations](https://rstudio.github.io/dygraphs/gallery-annotations.html).
- Use at the R console just like conventional R plots (via RStudio Viewer).
- Seamless embedding within [R Markdown](https://rstudio.github.io/dygraphs/r-markdown.html) documents and [Shiny](https://rstudio.github.io/dygraphs/shiny.html) web applications.

#### Installation

The dygraphs package depends on the development version of the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) package so you need to install both packages. You can do this using the **devtools** package as follows:

```S
devtools::install_github(c("Displayr/htmlwidgets", "Displayr/dygraphs"))
```

#### Usage

If you have an xts-compatible time-series object creating an interactive plot of it is as simple as this:

```S
dygraph(nhtemp, main = "New Haven Temperatures")
```

You can also further customize axes and series display as well as add interacitve features like a range selector:

```S
dygraph(nhtemp, main = "New Haven Temperatures") %>%
  dyAxis("y", label = "Temp (F)", valueRange = c(40, 60)) %>%
  dyOptions(fillGraph = TRUE, drawGrid = FALSE) %>%
  dyRangeSelector()
```

See the [online documentation](http://rstudio.github.io/dygraphs) for the dygraphs package for additional details and examples.

#### Displayr extensions
This fork extends the dygraphs package by adding d3.format for use as a value formatter. This is intended to be used with the `xxxFormatter` parameters of the dyAxis function:

```S
dyGraph(nhtemp, main = "New Haven Temperatures") %>%
  dyAxis("y", 
         label = "Temp (F)", 
         valueRange = c(40, 60),
         valueFormatter = d3formatFn(".3f"),
         axisLabelFormatter = d3formatFn(".0f")
  )
```







