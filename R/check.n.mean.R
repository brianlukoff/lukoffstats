#' Check if the distribution is close enough to Normal for the Central Limit Theorem to apply.
#'
#' @param y A variable containing quantitative data.
#' @importFrom e1071 skewness kurtosis
#' @importFrom crayon black red green
#' @export
check.n.mean <- function(y) {
  hist(y, prob = TRUE, main="", xlab="Variable")
  x <- seq(min(y), max(y), length.out=1000)
  curve(dnorm(x, mean = mean(y), sd = sd(y)), col = 'red', add = TRUE)

  message(black("Sample size = ", length(y)))

  message(" ")

  message(black("Skewness = ", round(skewness(y), 4)))
  message(black("10*(skewness)^2 = ", round(10*skewness(y)^2, 2)))
  if (length(y) > 10*skewness(y)^2) {
    message(green("Sample size is large enough based on skewness"))
  } else {
    message(red("Sample size is NOT large enough based on skewness"))
  }

  message(" ")

  message(black("Kurtosis = ", round(kurtosis(y), 4)))
  message(black("10*abs(kurtosis) = ", round(10*abs(kurtosis(y)), 2)))
  if (length(x) > 10*abs(kurtosis(y))) {
    message(green("Sample size is large enough based on kurtosis"))
  } else {
    message(red("Sample size is NOT large enough based on kurtosis"))
  }
}
