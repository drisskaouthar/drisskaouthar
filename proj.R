library(readxl)
library(ggplot2)
library(scales)
library(plotly)
library(dplyr)

library(maptools)
library(sp)
library(shapefiles)
library(leaflet)


proj_R <- read_excel("C:/Users/KATHY/Desktop/travail/projet_EnqueteNationaleduTravaildesEnfantsenTunisie2017.xlsx")
attach(proj_R)

View(proj_R)


age = data.frame(proj_R[1:3,])
sexe = data.frame(proj_R[4:5,])
milieu = data.frame(proj_R[6:7,])
region = data.frame(proj_R[8:14,])

#statistique descriptive:

summary(proj_R)

##ecart type
sapply(proj_R[,3:6], sd)

##variance
sapply(proj_R[,3:6], var )



#pie

colors <- c( 'rgb(128,133,133)', 'rgb(211,94,96)')

######## sexe ######
p_s <- plot_ly(sexe, labels = sexe[,2], values = sexe[,3], type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE) %>%
  layout(title = 'Population total d enfants selon sexe',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p_s

p_eco <- plot_ly(sexe, labels = sexe[,2], values = sexe[,4], type = 'pie',
                 textposition = 'inside',
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 
                 marker = list(colors = colors,
                               line = list(color = '#FFFFFF', width = 1)),
                 #The 'pull' attribute can also be used to create space between the sectors
                 showlegend = FALSE) %>%
  layout(title = 'Enfant economiquement occupe',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p_eco

p_ndg <- plot_ly(sexe, labels = sexe[,2], values = sexe[,5], type = 'pie',
                 textposition = 'inside',
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 
                 marker = list(colors = colors,
                               line = list(color = '#FFFFFF', width = 1)),
                 #The 'pull' attribute can also be used to create space between the sectors
                 showlegend = FALSE) %>%
  layout(title = 'travaux non dangereux',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p_ndg

p_dg <- plot_ly(sexe, labels = sexe[,2], values = sexe[,6], type = 'pie',
                textposition = 'inside',
                textinfo = 'label+percent',
                insidetextfont = list(color = '#FFFFFF'),
                hoverinfo = 'text',
                
                marker = list(colors = colors,
                              line = list(color = '#FFFFFF', width = 1)),
                #The 'pull' attribute can also be used to create space between the sectors
                showlegend = FALSE) %>%
  layout(title = 'travaux dangereux',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p_dg

######milieu_barplot######

b_pt <- plot_ly(milieu, x = milieu[,2], y = milieu[,3], type = 'bar', text = text,
                marker = list(color = 'rgb(158,202,225)',
                              line = list(color = 'rgb(8,48,107)',
                                          width = 1.5))) %>%
  layout(title = "Population total d enfants selon milieu",
         xaxis = list(title = ""),
         yaxis = list(title = "Population total d enfants"))
b_pt


b_eco <- plot_ly(milieu, x = milieu[,2], y = milieu[,4], type = 'bar', text = text,
                 marker = list(color = 'rgb(158,202,225)',
                               line = list(color = 'rgb(8,48,107)',
                                           width = 1.5))) %>%
  layout(title = "Enfant economiquement occupe",
         xaxis = list(title = ""),
         yaxis = list(title = ""))
b_eco

b_ndg <- plot_ly(milieu, x = milieu[,2], y = milieu[,5], type = 'bar', text = text,
                 marker = list(color = 'rgb(158,202,225)',
                               line = list(color = 'rgb(8,48,107)',
                                           width = 1.5))) %>%
  layout(title = "Travaux Non Dangereux",
         xaxis = list(title = ""),
         yaxis = list(title = ""))
b_ndg

b_dg <- plot_ly(milieu, x = milieu[,2], y = milieu[,6], type = 'bar', text = text,
                marker = list(color = 'rgb(158,202,225)',
                              line = list(color = 'rgb(8,48,107)',
                                          width = 1.5))) %>%
  layout(title = "Travaux Dangereux",
         xaxis = list(title = ""),
         yaxis = list(title = ""))
b_dg

#

boxplot(proj_R$Enfants.economiquement.occupes, main="Enfants economiquement occupes")

boxplot(proj_R$enfants.dans.le.travail.des.enfants,proj_R$enfants.dans.les.travaux.dangereux,names=c("non dangereux","dangereux"))


########
x=proj_R$X__1[8:14]
y=proj_R$Population.totale.d.enfants.ages.de.5.a.17ans[8:14]

dat= data.frame( x=proj_R$X__1[8:14],
                 y=proj_R$Population.totale.d.enfants.ages.de.5.a.17ans[8:14])

p.t <- plot_ly(y=y, x=x, type ='bar') %>%
  layout(yaxis=list(type='linear'),title="population tolale d'enfants")
p.t


eco.oc= plot_ly(y=Enfants.economiquement.occupes[8:14], x=x, type ='bar') %>%
  layout(yaxis=list(type='linear'),title="Enfants economiquement occupes")
eco.oc


t.e= plot_ly(y=enfants.dans.le.travail.des.enfants[8:14], x=x, type ='bar') %>%
  layout(yaxis=list(type='linear'),title="travail non dangeux")
t.e

t.d= plot_ly(y=enfants.dans.les.travaux.dangereux[8:14], x=x, type ='bar') %>%
  layout(yaxis=list(type='linear'),title="travail dangeux")
t.d



########
reg <- dat %>%
  group_by(x) %>%
  plot_ly(labels = x, values = y) %>%
  add_pie(hole = 0.6) %>%
  layout(title = "Population totale d'enfants par region",  showlegend = F,
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

reg


g <- ggplot(proj_R, aes(X__1[1:3])) + scale_fill_brewer(palette = "Spectral")

g + geom_freqpoly(aes(fill=Population.totale.d.enfants.ages.de.5.a.17ans[1:3]), 
                  binwidth = .1, 
                  col="black", 
                  size=.1) +  # change binwidth
  labs(title="Histogram with Auto Binning", 
       subtitle="Engine Displacement across Vehicle Classes")  


