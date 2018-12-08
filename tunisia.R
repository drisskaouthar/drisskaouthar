library(maptools)
library(sp)
library(shapefiles)

tn_deleg<-"/Users/dhafermalouche/Documents/GitHub/Maps-of-Tunisia-delagations/Tunisie_snuts4.shp"
m_deleg <- readShapePoly(tn_deleg)

plot(m_deleg)

tn_gouv<-"/Users/dhafermalouche/Documents/GitHub/Maps-of-Tunisia-Gouvernorat/Tunisie_snuts3.shp"
m_gouv <- readShapePoly(tn_gouv)

plot(m_gouv)

library(raster)
m_deleg2<- getData(name="GADM",  country="TUN", level=2)

plot(m_deleg2)
plot(m_gouv2)
m_gouv2<- getData(name="GADM",  country="TUN", level=1)