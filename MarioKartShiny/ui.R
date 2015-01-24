library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("MarioKart64 Data Exploration"),
  sidebarPanel(
    
    h3("Density Plot Controls"),
    h4("Chosen matches are: "),
    
    sliderInput("MatchSlider", "Slide to choose a window of matches:",
                min = 1, max = 100, value = c(1, 100)),
    
    verbatimTextOutput("OMatchSlider"),
    
    selectInput("lookat", label = h3("Data to look at"), 
                choices = list("Match Points" = "MatchPoints", "Cup Points" = "CupPoints", "Races Won in Match" = "MatchRaceWins", "Race Points" = "Points"), selected = 1),
    selectInput("by", label = h3("Split by:"), 
                choices = list("Racer" = "Racer", "Extra or 150cc" = "Extra150cc", "Cup" = "Cup"), selected = 1)
  ),

  mainPanel(
    h3('Main Panel text'),
    plotOutput('ggDensity'),
    code('some code'),
    p(' some ordinary text'),
    h3('Illustrating how outputs work'),
    h4('You entered:')
    #tableOutput("table")
  )
  
))
