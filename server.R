library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Data science for the win!"),
  sidebarPanel(
    h3('Sidebar text')
  )
  mainpanel(
    h3('Main Panel text')
  )
))