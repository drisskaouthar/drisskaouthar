library(shiny)
library(shinythemes)
library(plotly)

shinyUI(navbarPage( h4("Travail des enfants en Tunisie",style="color:#ff6666;"),
                    theme = shinythemes::shinytheme("flatly"),
                    tabPanel(h4("About", style=" font-weight:bold;#000000"),
                             fluidRow(
                               column(6,includeMarkdown("trav.Rmd")),
                               column(3,
                                      img(src='trav.PNG'))
                               )
                             
                             ),
                    tabPanel(h4("Table", style=" font-weight:bold;#000000"),
                             DT::dataTableOutput("table")),
                    
                    
                    tabPanel(h4("Plot", style=" font-weight:bold;#000000"),
                             sidebarLayout(
                               sidebarPanel(
                                 h3("Filtrer les données"),
                                 selectInput("dataset", "Choisissez un ensemble de données", 
                                             choices = c( "Sexe", "Milieu", "Region")),
                                 selectInput("Yvar", "Choisissez votre variable", 
                                             choices = c("Population.totale.d.enfants", "Enfants.economiquement.occupes", "enfants.dans.le.travail.des.enfants", "enfants.dans.les.travaux.dangereux", selected = "Population.totale.d.enfants")
                                 )), 
                                 mainPanel(
                                   plotlyOutput("tot")
                                   
                                 )
                               )
                             ),
                    
                    navbarMenu(h4("Summary", style=" font-weight:bold;#000000"),
                     tabPanel(h4("Summary", style=" font-weight:bold;#000000"), 
                             
                             verbatimTextOutput("summary")),
                     tabPanel(h4("ecart-type", style=" font-weight:bold;#000000"),
                             verbatimTextOutput("su")),
                     tabPanel(h4("variance", style=" font-weight:bold;#000000"),
                             verbatimTextOutput("sum"))),
                     
                     navbarMenu(h4("More", style=" font-weight:bold;#000000"),
                     tabPanel(h4("cartographie1", style=" font-weight:bold;#000000"),
                              sidebarPanel(
                                h3("Population totale d enfants")),      
                              mainPanel(
                              leafletOutput("map"))),
                     tabPanel(h4("cartographie2", style=" font-weight:bold;#000000"),
                              sidebarPanel(
                                h3("Enfants economiquement occupes")),
                              mainPanel(
                               leafletOutput("map1"))),
                     tabPanel(h4("cartographie3", style=" font-weight:bold;#000000"),
                              
                              sidebarPanel(
                                h3("Enfants dans le travail des enfants")),
                              
                              mainPanel(
                              leafletOutput("map2"))),
                     tabPanel(h4("cartographie4", style=" font-weight:bold;#000000"),
                             
                              sidebarPanel(
                                h3("Enfants dans le travail dans les travaux dangereux")),
                              mainPanel(
                               leafletOutput("map3")))
                     ,
                     
                     tabPanel(h4("other plots", style=" font-weight:bold;#000000"),
                              plotlyOutput("to"),
                              plotlyOutput("tott"))
                      
                              
                     
                             
                    )))
                    