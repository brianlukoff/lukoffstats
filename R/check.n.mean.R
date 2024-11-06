#' Check if the distribution is close enough to Normal for the Central Limit Theorem to apply.
#'
#' @param y A variable containing quantitative data.
#' @export
check.n.mean <- function(y) {
  hist(y, prob = TRUE, main="", xlab="Variable")
  x <- seq(min(y), max(y), length.out=1000)
  curve(dnorm(x, mean = mean(y), sd = sd(y)), col = "red", add = TRUE)

  cat(sprintf("Sample size     = %d\n\n", length(y)))
  cat(sprintf("Skewness        = %.4f\n", skewness(y)))
  cat(sprintf("10*(skewness)^2 = %.2f\n", 10*skewness(y)^2))
  if (length(y) > 10*skewness(y)^2) {
    cat("  Sample size is large enough based on skewness\n\n")
  } else {
    cat("  Sample size is NOT large enough based on skewness\n\n")
  }

  cat(sprintf("Kurtosis        = %.4f\n", kurtosis(y)))
  cat(sprintf("10*|kurtosis|   = %.2f\n", 10*abs(kurtosis(y))))
  if (length(x) > 10*abs(kurtosis(y))) {
    cat("  Sample size is large enough based on kurtosis\n")
  } else {
    cat("  Sample size is NOT large enough based on kurtosis\n")
  }
}
