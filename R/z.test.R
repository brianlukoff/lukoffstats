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
z.test <- function(p.hat, n, p0, alternative=c("two.sided", "less", "greater"), conf.level=0.95) {
  alternative <- match.arg(alternative)
  data.name <- deparse(substitute(p.hat))
  z <- (p.hat - p0) / sqrt(p0 * (1 - p0) / n)
  critical.value <- qnorm(1 - (1 - conf.level) / 2)
  standard.error <- sqrt(p.hat * (1 - p.hat) / n)
  if (is.na(alternative) || alternative == "two.sided") {
    p.value <- 2 * pnorm(-abs(z))
  } else if (alternative == "less") {
    p.value <- pnorm(z)
  } else if (alternative == "greater") {
    p.value <- 1 - pnorm(z)
  }
  cint <- p.hat + c(-1, 1) * critical.value * standard.error
  attr(cint, "conf.level") <- conf.level
  names(p.hat) <- "sample proportion"
  names(p0) <- "proportion"
  names(standard.error) <- "standard error"
  names(z) <- "z"
  rval <- list(
    statistic = z,
    parameter = standard.error,
    p.value = p.value,
    conf.int = cint,
    estimate = p.hat,
    null.value = p0,
    alternative = alternative,
    method = "z test for a proportion",
    sample.size = n,
    data.name = data.name
  )
  class(rval) <- "htest"
  return(rval)
}
