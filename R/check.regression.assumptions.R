#' Diagnostic plots for checking regression assumptions
#'
#' Produces diagnostic plots to aid in checking the LINE regression assumptions.
#' @param model A linear regression model produced by the `lm` function.
#' @export
check.regression.assumptions <- function(model) {
  se <- summary(model)$sigma
  predicted <- predict(model)
  resid <- residuals(model)

  par(mfrow=c(2,2))
  plot(resid ~ predicted,
       xlab="Predicted values", ylab="Residuals",
       ylim=c(min(resid, -3*se), max(resid, 3*se)),
       main="Residual plot")
  abline(0, 0, col="blue", lty=2)
  abline(2*se, 0, col="red", lty=2)
  abline(-2*se, 0, col="red", lty=2)

  plot(resid, main="Residuals vs. row number", ylab="Residuals", xlab="Row number")
  abline(0,0, lty=2, col="red")

  hist(resid, prob=TRUE, xlab="Residuals")
  curve(dnorm(x, mean=mean(resid), sd=sd(resid)), col="red", add=TRUE)

  qqnorm(resid, ylab="Standardized residuals", xlab = "Normal scores")
  qqline(resid, col="red")
}
