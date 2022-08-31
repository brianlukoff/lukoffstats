#' Two-sample z-test for proportions, with confidence intervals
#'
#' Executes hypothesis tests and calculates confidence intervals for the difference of two proportions.
#' @param p1.hat The first sample proportion.
#' @param n1 The first sample size.
#' @param p2.hat The second sample proportion.
#' @param n2 The second sample size.
#' @param alternative The alternative hypothesis, either `two.sided` (default), `less`, or `greater`.
#' @param conf.level The confidence level for the confidence interval. Defaults to 0.95 for a 95% confidence interval.
#' @importFrom stats pnorm qnorm
#' @export
z.test.diff <- function(p1.hat, n1, p2.hat, n2, alternative=c("two.sided", "less", "greater"), conf.level=0.95) {
  p.combined <- (p1.hat*n1 + p2.hat*n2)/(n1 + n2)
  z <- (p1.hat - p2.hat) / sqrt(p.combined * (1 - p.combined) * (1/n1 + 1/n2))
  critical.value <- qnorm(1 - (1 - conf.level) / 2)
  standard.error <- sqrt(p1.hat * (1 - p1.hat) / n1 + p2.hat * (1 - p2.hat) / n2)
  ci.lower.bound <- (p1.hat - p2.hat) - critical.value * standard.error
  ci.upper.bound <- (p1.hat - p2.hat) + critical.value * standard.error
  if (is.na(alternative) || alternative == "two.sided") {
    p.value <- 2 * pnorm(-abs(z))
    alternative <- sprintf("difference not equal to %.4f", 0)
  } else if (alternative == "less") {
    p.value <- pnorm(z)
    alternative <- sprintf("difference < %.4f", 0)
  } else if (alternative == "greater") {
    p.value <- 1 - pnorm(z)
    alternative <- sprintf("difference > %.4f", 0)
  }
  cat(sprintf("z-test for difference of proportions\n"))
  cat(sprintf("Null hypothesis: difference = %s\n", 0))
  cat(sprintf("Alternative hypothesis: %s\n", alternative))
  cat(sprintf("Difference of sample proportions: %s\n", format(p1.hat - p2.hat)))
  cat("\n")
  cat(sprintf("Test statistic: z = %s\n", format(z)))
  cat(sprintf("p-value: %s\n", format(p.value)))
  cat(sprintf("%d%% confidence interval: %s to %s", 100 * conf.level, format(ci.lower.bound), format(ci.upper.bound)))
}
