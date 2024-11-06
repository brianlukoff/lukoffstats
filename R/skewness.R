#' Calculate skewness.
#'
#' @param x A variable containing quantitative data.
#' @export
skewness <- function(x, na.rm = FALSE) {
  if (any(ina <- is.na(x))) {
    if (na.rm) {
      x <- x[!ina]
    } else {
      return(NA)
    }
  }
  n <- length(x)
  x <- x - mean(x)
  return(sqrt(n) * sum(x^3) / sum(x^2)^(3/2) * (1 - 1/n)^(3/2))
}
