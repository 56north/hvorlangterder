% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apicalls.R
\name{multiroute}
\alias{multiroute}
\title{Route to multiple destinations}
\usage{
multiroute(fromaddress = NULL, fromcoord = NULL, tocoords = NULL,
  mot = NULL, routepolyline = NULL, traveltime = NULL)
}
\arguments{
\item{fromaddress}{is an adress type: roadname+housenumber+postalcode}

\item{fromcoord}{is a coordinate type: latitude, longtitude}

\item{tocoords}{is a coordinate type: latitude, longtitude. Must be a data frame with a lat and lng column}

\item{mot}{is a mode of transport designator
\itemize{
  \item car (default)
  \item bicycle
  \item foot
  \item public
  \item auto
}}

\item{routepolyline}{append a route in the form of a list of coordinates.
\itemize{
  \item 0 (default): without route description
  \item 1: with route description as a an encoded polyline string
  \item 2: with route description as a list of latitude,longtitude pairs.
}}

\item{traveltime}{used in combination with mot = public.
\itemize{
  \item WEEKSTART (default): 09:00 on the first following weekday.
  \item NOW: Use current time
  \item datetime: Datetime string in the ISO 8601 format YYYY-MM-DDThh:mm (ie. 2016-10-30T16:56)
}}
}
\value{
Returns a list
}
\description{
Calculate routes from a single point to one or more coordinates.
}
\examples{

# Create data frame with coordinates
coords <- dplyr::data_frame(
  lat = c(55.689298, 55.683842, 55.679184),
  lng = c(12.557549, 12.571044, 12.585228))

# Request with origintype as coordinate:
multiroute(fromcoord = "55.68958,12.557845", tocoords = coords)

# Request with origintype as address:
multiroute(fromaddress = "elmegade 5 2200", tocoords = coords)

# Request compressed polylines for each route:
mymultiroute <- multiroute(fromcoord = "55.68958,12.557845", tocoords = coords, routepolyline = 1)

# Decode the compressed polyline
decodepolyline(mymultiroute[[1]]$routepolyline)

}

