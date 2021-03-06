% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apicalls.R
\name{route}
\alias{route}
\title{Route From A to B}
\usage{
route(fromaddress = NULL, fromcoord = NULL, toaddress = NULL,
  tocoord = NULL, mot = NULL, routepolyline = NULL, traveltime = NULL)
}
\arguments{
\item{fromaddress}{is an adress type: roadname+housenumber+postalcode}

\item{fromcoord}{is a coordinate type: latitude, longtitude}

\item{toaddress}{is an adress type: roadname+housenumber+postalcode}

\item{tocoord}{is a coordinate type: latitude, longtitude}

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
Caluculate a routed distance between two points, with optional route description
}
\examples{

# Route between a pair of coordinates:
route(fromcoord = "55.68958,12.55784", tocoord = "55.69043,12.53527")

# Route between a pair of addresses:
route(fromaddress = "elmegade 5 2200", toaddress = "Rådhuspladsen 2, 1550 København V, 1550")

# Route from address to coordinate:
route(fromaddress = "elmegade 5 2200", tocoord = "55.69043,12.53527")

# Setting mode of transport to bicycle
route(fromcoord = "55.68958,12.55784", tocoord = "55.69043,12.53527", mot = "bicycle")

# Request polyline as list of coordinates and setting mode of transport to foot
route(fromcoord = "55.68958,12.55784", tocoord = "55.69043,12.53527", mot = "foot", routepolyline = 2)

}

