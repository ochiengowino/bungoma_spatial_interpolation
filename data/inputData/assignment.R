ls()
plot(po)
gadm

pol.data <- gadm
point.data <- po

point.data
pol.data

library("sp")
library("rgdal")
library("rgeos")
library("tmap")
library("spatstat")
library("maptools")
library("gstat")
dat.pp <- as(dirichlet(as.ppp(pol.data)), "SpatialPolygons")
dat.pp <- as(po,"SpatialPolygons")
proj4string(po) <- CRS("+init=EPSG:27700")