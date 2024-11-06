#' Calculate kurtosis.
#'
#' @param x A variable containing quantitative data.
#' @export
kurtosis <- function (x, na.rm = FALSE) {
  if (any(ina <- is.na(x))) {
    if (na.rm) {
      x <- x[!ina]
    } else {
      return(NA)
    }
  }
  n <- length(x)
  x <- x - mean(x)
  return(n * sum(x^4)/sum(x^2)^2 * (1 - 1/n)^2 - 3)
}
