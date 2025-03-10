% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GeostTextureLibrarySharedRoxy.R
\name{RRI}
\alias{RRI}
\alias{RRI.numeric}
\alias{RRI.SpatRaster}
\title{RRI: Radial Roughness index}
\usage{
RRI(x, ...)

\method{RRI}{numeric}(x, ...)

\method{RRI}{SpatRaster}(x, ..., .method = c("rcpp", "r"))
}
\arguments{
\item{x}{A DEM as a SpatRaster or a vector of numeric values from a focal window in a DEM from which to compute the index}

\item{...}{reserved for future use}

\item{.method}{Either \code{r} or \code{rcpp} (fast batch processing using C++)}
}
\value{
isotropic roughness (in the same units of input)
}
\description{
Modified TRI, based on increments of order 2  (removing slope dependence) and correcting for diagonal distance.
RRI modifies TRI (topographic ruggedness index) using increments of order 2, symmetrical to the central pixel,
so as to remove the effect of local slope.
This version corrects for the diagonal distance using bilinear interpolation.
It uses a 5x5 kernel, consequently 12 directional differences of order k (2)
are used in the estimation.
One could also use a 3x3 kernel using only the 4 differences centered on the central pixel
but the metric would be very noisy.
The input is the DEM (no need to detrend).
}
\examples{
library(terra)
dem= rast(paste(system.file("extdata", package = "SurfRough"), "/trento1.tif",sep=""))
w <- matrix(1, nrow=5, ncol=5)
roughTrick5x5_v1=focal(dem, w=w, fun=RRI)
roughTrick5x5_v2=RRI(dem)
plot(c(roughTrick5x5_v1, roughTrick5x5_v2))
}
\references{
\enumerate{
\item Riley, S. J., S. D. DeGloria, and R. Elliott. 1999.
A terrain ruggedness index that quantifies topographic heterogeneity.
Intermountain Journal of Science 5:23.
\item Wilson, M.F.J., O'Connell, B., Brown, C., Guinan, J.C. & Grehan, A.J. 2007.
Multiscale terrain analysis of multibeam bathymetry data for habitat mapping on the continental slope".
Marine Geodesy, vol. 30, no. 1-2, pp. 3-35.
\item Trevisani S., Teza G., Guth P.L., 2023. Hacking the topographic ruggedness index. Geomorphology
https://doi.org/10.1016/j.geomorph.2023.108838
}
}
