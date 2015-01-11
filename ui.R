library(shiny)
library(HistData)
shinyUI(pageWithSidebar(
  headerPanel("Illustrating inputs"),
  sidebarPanel(
    numericInput('id1', 'Numeric input, labeled id1', 0, min=0, max=1, step=1),
    checkboxGroupInput("id2", "Checkbox",
                       c("Value 1" = "1",
                         "Value 2" = "2",
                         "Value 3" = "3")),
    dateInput("date", "Date:"),
    h3('Sidebar text'),
    h1('H1 text'),
    h4('H4 text'),
    numericInput('glucose', 'Glucose mg/dl', 90, min=50, max=200, step=5),
    submitButton('Submit'),
    sliderInput('mu', 'Guess at the mean', value=70, min=62, max=74, step=.05)
  ),
  mainPanel(
    h3('Main Panel text'),
    code('some code'),
    p(' some ordinary text'),
    h3('Illustrating how outputs work'),
    h4('You entered:'),
    verbatimTextOutput("oid1"),
    h4('You entered'),
    verbatimTextOutput("oid2"),
    h4('You entered'),
    verbatimTextOutput("odate"),
    h3('Results of prediction'),
    h4('You entered'),
    verbatimTextOutput("inputValue"),
    h4('Which resulted in a prediction of '),
    verbatimTextOutput("prediction"),
    plotOutput('newHist')
  )
))