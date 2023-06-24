#' Cramer's V for quantifying the association between two categorical variables
#'
#' Calculates the Cramer's V statistic, which rescales chi-squared to be on a scale from 0 to 1.
#' @param tbl A two-way frequency table comparing two categorical variables.
#' @export
cramer.v <- function(tbl) {
  n <- sum(tbl)
  chi.squared <- as.numeric(chisq.test(tbl, correct=F)$statistic)
  sqrt((chi.squared/n) / min(nrow(tbl)-1, ncol(tbl)-1))
}
