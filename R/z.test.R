#' One-sample z-test for proportions, with confidence intervals
#'
#' Executes hypothesis tests and calculates confidence intervals for a proportion.
#' @param p.hat The sample proportion.
#' @param n The sample size.
#' @param p0 The value of the population proportion under the null hypothesis. Not needed to calculate confidence intervals..
#' @param alternative The alternative hypothesis, either `two.sided` (default), `less`, or `greater`.
#' @param conf.level The confidence level for the confidence interval. Defaults to 0.95 for a 95% confidence interval.
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
    alternative <- sprintf("p not equal to %s", format(p0))
  } else if (alternative == "less") {
    p.value <- pnorm(z)
    alternative <- sprintf("p < %s", format(p0))
  } else if (alternative == "greater") {
    p.value <- 1 - pnorm(z)
    alternative <- sprintf("p > %s", format(p0))
  }
  cat(sprintf("z-test for proportions\n"))
  cat(sprintf("Null hypothesis: p = %s\n", format(p0)))
  cat(sprintf("Alternative hypothesis: %s\n", alternative))
  cat(sprintf("Sample proportion: %s\n", format(p.hat)))
  cat("\n")
  cat(sprintf("Test statistic: z = %s\n", format(z)))
  cat(sprintf("p-value: %s\n", format(p.value)))
  cat(sprintf("%d%% confidence interval: %s to %s", 100 * conf.level, format(ci.lower.bound), format(ci.upper.bound)))
}
