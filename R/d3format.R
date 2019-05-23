
#' Return textual javascript source that will return a function that lazily instantiate a formatter
#' for the given string and use it to format the parameter given to the function.
#'
#' Note that the lazy instantiation means that we only create a formatting function once, and then call it repeatedly. This creates a 
#' small permanent memory footprint containing all the previously requested formatters.
#' 
#' @param formatStr the d3.format string format specification
#' @param paramName the name used for the value parameter in the resulting format. Defaults to "value"
#' @keywords d3.format javascript
#' @export
#' @examples
#' d3format(".3f") # return a javascript string which will give you a function that formats values in fixed format with 3 decimal points
#' d3format("e")   # return a javascript string that will give you a function that formats values in engineering format
#' d3format(".3f", "val") # return a javascript string that will reuse the fixed formatter instantiated in the earlier example, with a param name 'val'
#' 

d3formatFn <- function(formatStr, paramName = "value") {
  sprintf("function(%1$s) { return window.d3format.getOrCreate('%2$s')(%1$s); }", paramName, formatStr);
}