\name{residuals.causalTree}
\alias{residuals.causalTree}
\title{
  Residuals From a Fitted Rpart Object 
}
\usage{
\method{residuals}{causalTree}(object, type = c("usual", "pearson", "deviance"), ...)
}
\description{
  Method for \code{residuals} for an \code{causalTree} object.
}
\arguments{
\item{object}{
  fitted model object of class \code{"causalTree"}.
}
\item{type}{
  Indicates the type of residual desired.

  For regression or \code{anova} trees all three residual
  definitions reduce to \code{y - fitted}.  This is the residual returned for
  \code{user} method trees as well.

  For classification trees the \code{usual} residuals
  are the misclassification losses L(actual, predicted) where L is the
  loss matrix.  With default losses this residual is
  0/1 for correct/incorrect classification.
  The \code{pearson} residual is 
  (1-fitted)/sqrt(fitted(1-fitted)) and the \code{deviance} residual is 
  sqrt(minus twice logarithm of fitted).

  For \code{poisson} and \code{exp}
  (or survival) trees, the \code{usual} residual
  is the observed - expected number of events.
  The \code{pearson} and \code{deviance} residuals are as defined in
  McCullagh and Nelder.
}
\item{\dots}{further arguments passed to or from other methods.}

}
\value{
  Vector of residuals of type \code{type} from a fitted \code{causalTree} object. 
}
\references{
  McCullagh P. and Nelder, J. A. (1989)
  \emph{Generalized Linear Models}.
  London: Chapman and Hall.
}
\examples{
fit <- causalTree(skips ~ Opening + Solder + Mask + PadType + Panel,
             data = solder, method = "anova")
summary(residuals(fit))
plot(predict(fit),residuals(fit))
}
\keyword{tree}
