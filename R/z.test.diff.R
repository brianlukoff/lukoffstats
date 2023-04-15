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
  alternative <- match.arg(alternative)
  p.combined <- (p1.hat*n1 + p2.hat*n2)/(n1 + n2)
  z <- (p1.hat - p2.hat) / sqrt(p.combined * (1 - p.combined) * (1/n1 + 1/n2))
  critical.value <- qnorm(1 - (1 - conf.level) / 2)
  standard.error <- sqrt(p1.hat * (1 - p1.hat) / n1 + p2.hat * (1 - p2.hat) / n2)
  if (is.na(alternative) || alternative == "two.sided") {
    p.value <- 2 * pnorm(-abs(z))
  } else if (alternative == "less") {
    p.value <- pnorm(z)
  } else if (alternative == "greater") {
    p.value <- 1 - pnorm(z)
  }
  cint <- (p1.hat - p2.hat) + c(-1, 1) * critical.value * standard.error
  attr(cint, "conf.level") <- conf.level
  names(standard.error) <- "standard error"
  names(z) <- "z"
  estimate <- c(p1.hat, p2.hat)
  names(estimate) <- c("proportion in sample 1", "proportion in sample 2")
  null.value <- 0
  names(null.value) <- "difference of proportions"
  rval <- list(
    statistic = z,
    parameter = standard.error,
    p.value = p.value,
    conf.int = cint,
    estimate = estimate,
    null.value = null.value,
    alternative = alternative,
    method = "Two-sample z test for a proportion"
  )
  class(rval) <- "htest"
  return(rval)
}
