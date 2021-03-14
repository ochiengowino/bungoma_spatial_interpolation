# Interplation using thr Inverse Distance Weighting(IDW) method

library("sp")
library("rgdal")
library("rgeos")
library("tmap")
library("spatstat")
library("maptools")
library("gstat")
library("raster")

proj4string(po) <- CRS('+proj=longlat +datum=WGS84 +no_defs')
proj4string(gadm) <- CRS('+proj=longlat +datum=WGS84 +no_defs')
writeOGR(po, dsn = "C:/Users/LYN/Desktop/BIG_BEN/Tests-for-GeoSpatial-Data-Scientist-master", layer = "po_Shapefile", driver = "ESRI Shapefile")
writeOGR(gadm, dsn = "C:/Users/LYN/Desktop/BIG_BEN/Tests-for-GeoSpatial-Data-Scientist-master", layer = "gadm_Shapefile", driver = "ESRI Shapefile")




shp <- readOGR(".", "point_shp")
shp2 <- readOGR(".", "gadm_Shapefile")

# define sample grid based on the extent of the points
grid <-spsample(po, type = 'regular', n = 1000)

# runs the idw for the pH variable of pont data
idw <- idw(po$pH ~ 1, po, newdata= grid)

#coerce to SpatialPixelsDataFrame
gridded(idw) <- TRUE

# coerce to raster
raster_idw <- raster(idw)

# reproject the raster to WGS84
projection(raster_idw) <- CRS("+proj=longlat +datum=WGS84 +no_defs")
plot(raster_idw)


# visualize in ggplot2 if necessary
idwdf = as.data.frame(idw)
ptsdf = as.data.frame(po)

ggplot()+
  geom_tile(data=idwdf, aes(x=x1, y = x2, fill = var1.pred))+
  geom_point(data = ptsdf, aes(x=coords.x1, y=coords.x2),shape=4)+
  scale_fill_gradientn(colours = terrain.colors(10))+
  theme_bw()



shp2 <- readOGR(".", "bungoma")



# Use the tmap package to visualize the output
tm_shape(raster_idw) + tm_raster("var1.pred", style = "quantile", n =200 ,
                                 palette = "Reds", legend.show = FALSE)+
  tm_shape(shp2) + tm_borders(alpha=.5)+
  tm_shape(shp) + tm_bubbles(size = "pH", col = "pH",
                                      palette = "Blues", style = "quantile",
                                      legend.size.show = FALSE,
                                      title.col = "pH") +
  tm_layout(legend.position = c("left", "bottom"), legend.text.size = 1.1,
            legend.title.size = 1.4, frame = FALSE, legend.bg.color = "white",
            legend.bg.alpha = 0.5)


# clipping the raster within the bungoma polygon shp
masked_idw <- crop(raster_idw, shp2)
masked_idw <- mask(raster_idw, shp2)

plot(masked_idw)

# Plottting the cropped layer in interractive mode(Using the tmap_mode("view") function)
tm_shape(masked_idw) + tm_raster("var1.pred", style = "quantile", n =200 ,
                                 palette = "RdYlGn", legend.show = FALSE)+ 
  tm_shape(shp2) + tm_borders(alpha=.5)+
  tm_shape(shp) + tm_bubbles(size = "pH", col = "pH",
                             palette = "RdYlGn", style = "quantile",
                             legend.size.show = FALSE,
                             title.col = "pH Value") +
  tm_layout(legend.position = c("right", "bottom"), legend.text.size = 0.8,
            legend.title.size = 1.1, frame = TRUE) # +
 tmap_mode("view")  #<- Use this to change the layer to interractive mode if necessary()


library(RColorBrewer)

?RColorBrewer
