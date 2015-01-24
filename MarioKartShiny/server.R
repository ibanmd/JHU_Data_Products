library(shiny)
library(googleVis)
library(ggplot2)

mariokart <- read.csv("MarioKart64.csv")
attach(mariokart)

shinyServer(
  function(input, output) {
    observe({
    
    ##############################################################
    if(input$lookat=="MatchRaceWins" & input$by=="Cup") {
      aees <- aes(x=MatchRaceWins, fill=Cup)
    }
    
    else if(input$lookat=="MatchRaceWins" & input$by=="Racer") {
      aees <- aes(x=MatchRaceWins, fill=Racer)
    }
    
    else if(input$lookat=="MatchRaceWins" & input$by=="Extra or 150cc") {
      aees <- aes(x=MatchRaceWins, fill=Extra150cc)
    }
    ##########
    else if(input$lookat=="MatchPoints" & input$by=="Cup") {
      aees <- aes(x=MatchPoints, fill=Cup)
    }
    
    else if(input$lookat=="MatchPoints" & input$by=="Racer") {
      aees <- aes(x=MatchPoints, fill=Racer)
    }
    
    else if(input$lookat=="MatchPoints" & input$by=="Extra or 150cc") {
      aees <- aes(x=MatchPoints, fill=Extra150cc)
    }
    ##########
    else if(input$lookat=="Points" & input$by=="Cup") {
      aees <- aes(x=Points, fill=Cup)
    }
    
    else if(input$lookat=="Points" & input$by=="Racer") {
      aees <- aes(x=Points, fill=Racer)
    }
    
    else if(input$lookat=="Points" & input$by=="Extra or 150cc") {
      aees <- aes(x=Points, fill=Extra150cc)
    }
    ##########
    else if(input$lookat=="CupPoints" & input$by=="Cup") {
      aees <- aes(x=CupPoints, fill=Cup)
    }
    
    else if(input$lookat=="CupPoints" & input$by=="Racer") {
      aees <- aes(x=CupPoints, fill=Racer)
    }
    
    else {
      aees <- aes(x=CupPoints, fill=Extra150cc)
    }
    ################################### AND NOW FINALLY THE GGPLOT
    ## ggplot
    matchrange <- input$MatchSlider[1]:input$MatchSlider[2]
    
    output$ggDensity <- renderPlot({
      ggplot(mariokart[(mariokart$Match. %in% matchrange), ], aees) + geom_density(alpha=.3)    
      })
    ##############################################################
    
    #table <- mariokart[(mariokart$Match. %in% matchrange), ]
    #output$table <- renderTable(table)
    
  })
})
