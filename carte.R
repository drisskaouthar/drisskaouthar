library(maptools)
library(sp)
library(shapefiles)
library(leaflet)
library(rgdal)
library(sf)
library(readxl)
library(nlme)
library(raster)

region <- read_excel("region-1.xlsx")


fdc <- readShapePoly("C:/Users/KATHY/Desktop/travail/Tunisie_snuts4.shp")
fdc
plot(fdc1)
fdc1<- getData(name="GADM", country="TUN", level=1)
plot(fdc1)
i=match(fdc1$HASC_1,region$code)

fdc1a=cbind.Spatial(fdc1,region[i,])
xv=fdc1a@data$Enfants.economiquement.occupes


MyPaletteColor <- colorBin("Reds", NULL,7)
my_popup <- paste0("<strong>",fdc1a@data$X__1,"</strong>",xv,"")
mm<-leaflet(data = fdc1a) %>%
       addProviderTiles("CartoDB.Positron") %>%
       addPolygons(fillColor = ~MyPaletteColor(xv), 
                                     fillOpacity = 0.8, 
                                     color = "#BDBDC3", 
                                     weight = 1, 
                                     popup = my_popup)
mm

xa=fdc1a@data$Population.totale.d.enfants.ages.de.5.a.17ans
my_popup <- paste0("<strong>",fdc1a@data$X__1,"</strong>",xa,"")
ma<-leaflet(data = fdc1a) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(fillColor = ~MyPaletteColor(xa), 
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = my_popup)
ma

xb=fdc1a@data$enfants.dans.le.travail.des.enfants
my_popup <- paste0("<strong>",fdc1a@data$X__1,"</strong>",xb,"")
mb<-leaflet(data = fdc1a) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(fillColor = ~MyPaletteColor(xb), 
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = my_popup)
mb


xc=fdc1a@data$enfants.dans.les.travaux.dangereux
my_popup <- paste0("<strong>",fdc1a@data$X__1,"</strong>",xc,"")
mc<-leaflet(data = fdc1a) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(fillColor = ~MyPaletteColor(xc), 
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = my_popup)
mc

