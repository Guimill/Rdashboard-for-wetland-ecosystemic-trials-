#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here :
#
#    http ://shiny.rstudio.com/
#

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here :
#
#    http ://shiny.rstudio.com/
#

library(curl)
library(shiny)
library(shinyWidgets)
library(rsconnect)
library(ggplot2)
library(magick)
library(imager)
library(png)
library(shinydashboard)
library(viridis)
library(cowplot)
library(colourpicker)


##############-----------côté interface utilisateur-----------##############


ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Création de graphique pour l'étude des fonctions des zones humides", titleWidth = 800),
  dashboardSidebar(sidebarMenu(
    menuItem(
      "Méthode Artelia",
      tabName = "Artelia",
      icon = icon("dashboard"),
      startExpanded = TRUE,
      menuSubItem('état initial', tabName = 'Artelia1'),
      menuSubItem('Compensation', tabName = 'Artelia2')
    ),
    menuItem(
      "Méthode nationale",
      tabName = "MN",
      icon = icon("th"),
      startExpanded = TRUE,
      menuSubItem('état initial', tabName = 'MN1'),
      menuSubItem('Compensation', tabName = 'MN2')
    )
  )),
  dashboardBody(tabItems(
    # Onglet méthode artelia - état initial
    tabItem(
      tabName = "Artelia1",
      fluidRow( 
        
        #Création des menus glissants
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes :",
          background = "light-blue",
          width = 2,
          
          sliderInput(
            "R",
            "Ralentissement des ruissellement et étalement des crues :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "E",
            "Stockage des eaux, recharge des nappes et soutien d'étiage :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "I",
            "Interception et rétention des sédiments,pollution et MES :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Rb",
            "Régulation des nutriments et pollution :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Cb",
            "Stockage et séquestration du carbone :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "C",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "S",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          )
          
        ),
        
        chooseSliderSkin("Flat", color = "cadetblue1"),
        
        #Création du graphique et du bouton de téléchargement
        
        box(class="text-center",
          solidHeader = TRUE, status = "primary", title = "Graphique",
          plotOutput("graph", width = "900px", height = "720px"),
          downloadButton('bleu', 'Téléchargement'),
          width = 8
        )
      )
    ),
    
    # Onglet méthode artelia - Compensation
    tabItem(
      tabName = "Artelia2",
      fluidRow(
        #Création des menus glissants
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes 'avant' :",
          background = "light-blue",
          width = 2,
          sliderInput(
            "R2",
            "Ralentissement des ruissellement et étalement des crues :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "E2",
            "Stockage des eaux, recharge des nappes et soutien d'étiage :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "I2",
            "Interception et rétention des sédiments,pollution et MES :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Rb2",
            "Régulation des nutriments et pollution :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Cb2",
            "Stockage et séquestration du carbone :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "C2",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "S2",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          )
        ),
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes 'après' :",
          background = "light-blue",
          width = 2,
          sliderInput(
            "R3",
            "Ralentissement des ruissellement et étalement des crues :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "E3",
            "Stockage des eaux, recharge des nappes et soutien d'étiage :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "I3",
            "Interception et rétention des sédiments,pollution et MES :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Rb3",
            "Régulation des nutriments et pollution :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Cb3",
            "Stockage et séquestration du carbone :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "C3",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "S3",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          )
        ),
        
        #Création du graphique et du bouton de téléchargement
        
        box(class="text-center",
          solidHeader = TRUE, status = "primary", title = "Graphique",
          colourInput("col","Cliquez pour choisir une couleur de contour","brown3"),
          plotOutput("graph2", width = "900px", height = "720px"),
          downloadButton('vert', 'Téléchargement'),
          width = 8
        )
      )
    ),
    
    # Onglet méthode nationale - état initial
    tabItem(
      tabName = "MN1",
      fluidRow(
        #Création des menus glissants
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes :",
          background = "light-blue",
          width = 2,
          sliderInput(
            "R4",
            "Ralentissement des ruissellement :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "N4",
            "Recharge des nappes :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Sh4",
            "Rétention des sédiments :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Nd4",
            "Dénitrification des nitrates :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Nv4",
            "Assimilation végétale de l'azote :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Pa4",
            "Adsorbtion, précipitation du phosphore :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Pv4",
            "Assimilation végétale des orthophosphates :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Cb4",
            "Séquestration du carbone :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "C4",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "S4",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          )
          
        ),
        
        #Création du graphique et du bouton de téléchargement
        
        box(class="text-center",
          solidHeader = TRUE, status = "primary", title = "Graphique",
          plotOutput("graph3", width = "900px", height = "720px"),
          downloadButton('yellow', 'Téléchargement'),
          width = 8
        )
      )
    ),
    
    # Onglet méthode nationale - Compensation
    tabItem(
      tabName = "MN2",
      fluidRow(
        #Création des menus glissants
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes 'avant' :",
          background = "light-blue",
          width = 2,
          sliderInput(
            "R5",
            "Ralentissement des ruissellement :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "N5",
            "Recharge des nappes :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Sh5",
            "Rétention des sédiments :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Nd5",
            "Dénitrification des nitrates :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Nv5",
            "Assimilation végétale de l'azote :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Pa5",
            "Adsorbtion, précipitation du phosphore :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Pv5",
            "Assimilation végétale des orthophosphates :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "Cb5",
            "Séquestration du carbone :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "C5",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          ),
          sliderInput(
            "S5",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 1,
            width = "200px"
          )
          
        ),
        
        box(solidHeader = TRUE, status = "primary", title = "Choix des notes 'après' :",
          background = "light-blue",
          width = 2,
          sliderInput(
            "R6",
            "Ralentissement des ruissellement :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "N6",
            "Recharge des nappes :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Sh6",
            "Rétention des sédiments :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Nd6",
            "Dénitrification des nitrates :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Nv6",
            "Assimilation végétale de l'azote :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Pa6",
            "Adsorbtion, précipitation du phosphore :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Pv6",
            "Assimilation végétale des orthophosphates :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "Cb6",
            "Séquestration du carbone :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "C6",
            "Connexion des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          ),
          sliderInput(
            "S6",
            "Support des habitats :",
            min = 1,
            max = 5,
            value = 2,
            width = "200px"
          )
          
        ),
        
        #Création du graphique et du bouton de téléchargement
        
        box(class="text-center",
          solidHeader = TRUE, status = "primary", title = "Graphique",
          colourInput("col2","Cliquez pour choisir une couleur de contour","brown3"),
          plotOutput("graph4", width = "900px", height = "720px"),
          downloadButton('rouge', 'Téléchargement'),
          width = 8
        )
      )
    )
    
  ))
)

##############-----------Côté serveur-----------##############

server <- function(input, output) {
  ##############Création des données##############
  
  
  # Création d'un tableau réactif pour le graphique 1
  
  Valeurs <- reactive({
    data.frame(
      SF = c(
        "1.Ralentissement des \n ruissellements et \n étalement des crues",
        "2.Stockage des\n eaux, recharge \n des nappes et \n soutien d'étiage",
        "3.Interception et \n rétention des sédiments,\n pollution et MES",
        "4.Régulation des \n nutriments et pollution",
        "5.Stockage et \n séquestration du carbone",
        "6.Connexion \n des habitats",
        "7.Support \n des habitats"
      ),
      
      Fonctions = c(
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique"
      ),
      
      Note = as.character(
        c(
          input$R,
          input$E,
          input$I,
          input$Rb,
          input$Cb,
          input$C,
          input$S
        )
      ),
      
      stringsAsFactors = FALSE
    )
  })
  
  # Création d'un tableau réactif pour le graphique 2
  
  Valeurs2 <- reactive({
    data.frame(
      SF = c(
        "1.Ralentissement des \n ruissellements et \n étalement des crues",
        "2.Stockage des\n eaux, recharge \n des nappes et \n soutien d'étiage",
        "3.Interception et \n rétention des sédiments,\n pollution et MES",
        "4.Régulation des \n nutriments et pollution",
        "5.Stockage et \n séquestration du carbone",
        "6.Connexion \n des habitats",
        "7.Support \n des habitats",
        "1.Ralentissement des \n ruissellements et \n étalement des crues",
        "2.Stockage des\n eaux, recharge \n des nappes et \n soutien d'étiage",
        "3.Interception et \n rétention des sédiments,\n pollution et MES",
        "4.Régulation des \n nutriments et pollution",
        "5.Stockage et \n séquestration du carbone",
        "6.Connexion \n des habitats",
        "7.Support \n des habitats"
      ),
      
      Fonctions = c(
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique",
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique"
      ),
      
      Note = as.character(
        c(
          input$R2,
          input$E2,
          input$I2,
          input$Rb2,
          input$Cb2,
          input$C2,
          input$S2,
          input$R3,
          input$E3,
          input$I3,
          input$Rb3,
          input$Cb3,
          input$C3,
          input$S3
        )
      ),
      
      Etat = c(
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après"
      ),
      
      stringsAsFactors = FALSE
    )
  })
  
  # Création d'un tableau réactif pour le graphique 3
  
  Valeurs3 <- reactive({
    data.frame(
      SF = c(
        "0.Ralentissement \n des ruissellements",
        "1.Recharge \n des nappes",
        "2.Rétention \n des \n sédiments",
        "3.Dénitrification \n des nitrates",
        "4.Assimilation \n végétale de l'azote",
        "5.Adsorbtion et \n précipitation \n du phosphore",
        "6.Assimilation \n végétale des \n orthophosphates",
        "7.       7.Séquestration \n du carbone",
        "8.Support \n des habitats",
        "9.Connexion \n des habitats"
      ),
      
      Fonctions = c(
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique"
      ),
      
      Note = as.character(
        c(
          input$R4,
          input$N4,
          input$Sh4,
          input$Nd4,
          input$Nv4,
          input$Pa4,
          input$Pv4,
          input$Cb4,
          input$C4,
          input$S4
        )
      ),
      
      stringsAsFactors = FALSE
    )
  })
  
  # Création d'un tableau réactif pour le graphique 4
  
  Valeurs4 <- reactive({
    data.frame(
      SF = c(
        "0.Ralentissement \n des ruissellements",
        "1.Recharge \n des nappes",
        "2.Rétention \n des \n sédiments",
        "3.Dénitrification \n des nitrates",
        "4.Assimilation \n végétale de l'azote",
        "5.Adsorbtion et \n précipitation \n du phosphore",
        "6.Assimilation \n végétale des \n orthophosphates",
        "7.       7.Séquestration \n du carbone",
        "8.Support \n des habitats",
        "9.Connexion \n des habitats",
        "0.Ralentissement \n des ruissellements",
        "1.Recharge \n des nappes",
        "2.Rétention \n des \n sédiments",
        "3.Dénitrification \n des nitrates",
        "4.Assimilation \n végétale de l'azote",
        "5.Adsorbtion et \n précipitation \n du phosphore",
        "6.Assimilation \n végétale des \n orthophosphates",
        "7.       7.Séquestration \n du carbone",
        "8.Support \n des habitats",
        "9.Connexion \n des habitats"
      ),
      
      Fonctions = c(
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique",
        "Hydrologique",
        "Hydrologique",
        "Hydrologique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Biogéochimique",
        "Ecologique",
        "Ecologique"
      ),
      
      Note = as.character(
        c(
          input$R5,
          input$N5,
          input$Sh5,
          input$Nd5,
          input$Nv5,
          input$Pa5,
          input$Pv5,
          input$Cb5,
          input$C5,
          input$S5,
          input$R6,
          input$N6,
          input$Sh6,
          input$Nd6,
          input$Nv6,
          input$Pa6,
          input$Pv6,
          input$Cb6,
          input$C6,
          input$S6
        )
      ),
      
      Etat = c(
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "avant",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après",
        "après"
      ),
      
      stringsAsFactors = FALSE
    )
  })
  
  #Création du graphique interactif 1 Méthode Artelia état initial
  
  Plotplot <- reactive({
    p <-
      ggplot(Valeurs() , aes(
        x = SF,
        y = as.numeric(Note),
        fill = Fonctions
      )) +
      geom_col(
        width = 1,
        colour = "slategrey",
        position = position_dodge(),
        linetype = 'dashed',
        size = 1.2
      ) +
      coord_polar() +
      ylim(-0.5, 5) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(
          size = 10,
          face = "bold",
          colour = c(
            "#708ce0ff",
            "#708ce0ff",
            "#708ce0ff",
            "#f28726ff",
            "#f28726ff",
            "#29c649fe",
            "#29c649fe"
          )
        ),
        axis.text.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        axis.title.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        legend.text = element_text(
          size = 12,
          face = "bold",
          colour = "slategrey"
        )
      ) +
      xlab("") + ylab("                                           Echelle de notation") +
      guides(fill = guide_legend(title.theme = element_text(size = 20, face = "bold", colour = "slategrey"))) +
      scale_fill_manual(values = alpha(c(
        "#f28726ff", "#29c649fe", "#708ce0ff"
      ), .6)) +
      geom_segment(
        aes(
          x = 0.5,
          y = 0,
          xend = 0.5,
          yend = 5
        ),
        size = 1.5,
        lineend = "round",
        colour = "slategrey",
        arrow = arrow(length = unit(0.4, "cm"))
      )
  })
  
  #Création du graphique interactif 2 Méthode Artelia Compensation
  
  Plotplot2 <- reactive({
    q <-
      ggplot(Valeurs2() , aes(
        x = SF,
        y = as.numeric(Note),
        fill = Fonctions
      )) +
      geom_col(
        data = subset(Valeurs2(), Etat == "avant"),
        width = 1,
        alpha = 0.8,
        colour = "slategrey",
        position = position_dodge(),
        linetype = 'dashed',
        size = 1.2
      ) +
      geom_col(
        data = subset(Valeurs2(), Etat == "après"),
        width = 1,
        alpha = 0.6,
        colour = input$col,
        position = position_dodge(),
        linetype = "solid",
        size = 1.2
      ) +
      coord_polar() +
      ylim(-0.5, 5) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(
          size = 10,
          face = "bold",
          colour = c(
            "#708ce0ff",
            "#708ce0ff",
            "#708ce0ff",
            "#f28726ff",
            "#f28726ff",
            "#29c649fe",
            "#29c649fe"
          )
        ),
        axis.text.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        axis.title.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        legend.text = element_text(
          size = 12,
          face = "bold",
          colour = "slategrey"
        )
      ) +
      xlab("") + ylab("                                           Echelle de notation") +
      guides(fill = guide_legend(title.theme = element_text(size = 20, face = "bold", colour = "slategrey"))) +
      scale_fill_manual(values = alpha(c(
        "#f28726ff", "#29c649fe", "#708ce0ff"
      ), .6)) +
      geom_segment(
        aes(
          x = 0.5,
          y = 0,
          xend = 0.5,
          yend = 5
        ),
        size = 1.5,
        lineend = "round",
        colour = "slategrey",
        arrow = arrow(length = unit(0.4, "cm"))
      )
  })
  
  #Création du graphique interactif 3 Méthode Nationale état initial
  
  Plotplot3 <- reactive({
    r <-
      ggplot(Valeurs3() , aes(
        x = SF,
        y = as.numeric(Note),
        fill = Fonctions
      )) +
      geom_col(
        width = 1,
        colour = "slategrey",
        position = position_dodge(),
        linetype = 'dashed',
        size = 1.2
      ) +
      coord_polar() +
      ylim(-0.5, 5) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(
          size = 12,
          face = "bold",
          colour = c(
            "#708ce0ff",
            "#708ce0ff",
            "#708ce0ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#29c649fe",
            "#29c649fe"
          )
        ),
        axis.text.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        axis.title.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        legend.text = element_text(
          size = 12,
          face = "bold",
          colour = "slategrey"
        )
      ) +
      xlab("") + ylab("                                           Echelle de notation") +
      guides(fill = guide_legend(title.theme = element_text(size = 20, face = "bold", colour = "slategrey"))) +
      scale_fill_manual(values = alpha(c(
        "#f28726ff", "#29c649fe", "#708ce0ff"
      ), .6)) +
      geom_segment(
        aes(
          x = 0.5,
          y = 0,
          xend = 0.5,
          yend = 5
        ),
        size = 1.5,
        lineend = "round",
        colour = "slategrey",
        arrow = arrow(length = unit(0.4, "cm"))
      )
  })
  
  #Création du graphique interactif 4 Méthode Nationale Compensation
  
  Plotplot4 <- reactive({
    s <-
      ggplot(Valeurs4() , aes(
        x = SF,
        y = as.numeric(Note),
        fill = Fonctions
      )) +
      geom_col(
        data = subset(Valeurs4(), Etat == "avant"),
        width = 1,
        alpha = 0.8,
        colour = "slategrey",
        position = position_dodge(),
        linetype = 'dashed',
        size = 1.2
      ) +
      geom_col(
        data = subset(Valeurs4(), Etat == "après"),
        width = 1,
        alpha = 0.6,
        colour = input$col2,
        position = position_dodge(),
        linetype = "solid",
        size = 1.2
      ) +
      coord_polar() +
      ylim(-0.5, 5) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(
          size = 12,
          face = "bold",
          colour = c(
            "#708ce0ff",
            "#708ce0ff",
            "#708ce0ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#f28726ff",
            "#29c649fe",
            "#29c649fe"
          )
        ),
        axis.text.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        axis.title.y = element_text(
          size = 15,
          face = "bold",
          colour = "slategrey"
        ),
        legend.text = element_text(
          size = 12,
          face = "bold",
          colour = "slategrey"
        )
      ) +
      xlab("") + ylab("                                           Echelle de notation") +
      guides(fill = guide_legend(title.theme = element_text(size = 20, face = "bold", colour = "slategrey"))) +
      scale_fill_manual(values = alpha(c(
        "#f28726ff", "#29c649fe", "#708ce0ff"
      ), .6)) +
      geom_segment(
        aes(
          x = 0.5,
          y = 0,
          xend = 0.5,
          yend = 5
        ),
        size = 1.5,
        lineend = "round",
        colour = "slategrey",
        arrow = arrow(length = unit(0.4, "cm"))
      )
  })
  
  ##############Rendu graphique (appartition sur l'interface utilisateur)##############
  
  #Sortie graphique 1
  
  output$graph <- renderPlot({
    p5 <- Plotplot()
    print(p5)
  })
  
  #Sortie graphique 2
  
  output$graph2 <- renderPlot({
    q5 <- Plotplot2()
    print(q5)
  })
  
  #Sortie graphique 3
  
  output$graph3 <- renderPlot({
    r5 <- Plotplot3()
    print(r5)
  })
  
  #Sortie graphique 4
  
  output$graph4 <- renderPlot({
    s5 <- Plotplot4()
    print(s5)
  })
  
  #Bouton de téléchargement graphique 1
  
  output$vert <- downloadHandler(
    filename = function() {
      paste('plot', '.png', sep = '')
    },
    content = function(file) {
      png(file,width = 1080,height = 720,units = "px",res = NA)
      print(Plotplot2())
      dev.off()
    }
  )
  
  #Bouton de téléchargement graphique 2
  
  output$bleu <- downloadHandler(
    filename = function() {
      paste('plot', '.png', sep = '')
    },
    content = function(file) {
      png(file,width = 1080,height = 720,units = "px",res = NA)
      print(Plotplot())
      dev.off()
    }
  )
  
  #Bouton de téléchargement graphique 3
  
  output$yellow <- downloadHandler(
    filename = function() {
      paste('plot', '.png', sep = '')
    },
    content = function(file) {
      png(file,width = 1080,height = 720,units = "px",res = NA)
      print(Plotplot3())
      dev.off()
    }
  )
  
  #Bouton de téléchargement graphique 4
  
  output$rouge <- downloadHandler(
    filename = function() {
      paste('plot', '.png', sep = '')
    },
    content = function(file) {
      png(file,width = 1080,height = 720,units = "px",res = NA)
      print(Plotplot4())
      dev.off()
    }
  )
}

shinyApp(ui = ui, server = server)
