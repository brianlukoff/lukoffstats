#' One-sample z-test for proportions, with confidence intervals
#'
#' Executes hypothesis tests and calculates confidence intervals for a proportion.
#' @param p.hat The sample proportion.
#' @param n The sample size.
#' @param p0 The value of the population proportion under the null hypothesis. Not needed to calculate confidence intervals..
#' @param alternative The alternative hypothesis, either `two.sided` (default), `less`, or `greater`.
#' @param conf.level The confidence level for the confidence interval. Defaults to 0.95 for a 95% confidence interval.
#' @export
#' @examples
#' @importFrom stats pnorm qnorm
#' @export
z.test <- function(p.hat, n, p0=0, alternative=c("two.sided", "less", "greater"), conf.level=0.95) {
  z <- (p.hat - p0) / sqrt(p0 * (1 - p0) / n)
  critical.value <- qnorm(1 - (1 - conf.level) / 2)
  standard.error <- sqrt(p.hat * (1 - p.hat) / n)
  ci.lower.bound <- p.hat - critical.value * standard.error
  ci.upper.bound <- p.hat + critical.value * standard.error
  if (is.na(alternative) || alternative == "two.sided") {
    p.value <- 2 * pnorm(-abs(z))
    alternative <- sprintf("p not equal to %.4f", p0)
  } else if (alternative == "less") {
    p.value <- pnorm(z)
    alternative <- sprintf("p < %.4f", p0)
  } else if (alternative == "greater") {
    p.value <- 1 - pnorm(z)
    alternative <- sprintf("p > %.4f", p0)
  }
  cat(sprintf("z-test for proportions\n"))
  cat(sprintf("Null hypothesis: p = %.4f\n", p0))
  cat(sprintf("Alternative hypothesis: %s\n", alternative))
  cat(sprintf("Sample proportion: %.4f\n", p.hat))
  cat("\n")
  cat(sprintf("p-value = %.24f\n", p.value))
  cat(sprintf("%d%% confidence interval: %.4f to %.4f", 100 * conf.level, ci.lower.bound, ci.upper.bound))
}
