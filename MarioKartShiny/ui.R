library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("MarioKart64 Data Exploration"),
  sidebarPanel(
    
    h2("Density Plot Controls"),
    h4("Chosen matches are: "),
    sliderInput("MatchSlider", "Slide to choose a window of matches:",
                min = 1, max = 100, value = c(1, 100)),
    
    selectInput("lookat", label = h4("Data to look at"), 
                choices = list("Match Points" = "MatchPoints", "Cup Points" = "CupPoints", "Races Won in Match" = "MatchRaceWins", "Race Points" = "Points"), selected = 1),
    selectInput("by", label = h4("Split the data by:"), 
                choices = list("Racer" = "Racer", "Extra or 150cc" = "Extra150cc", "Cup" = "Cup"), selected = 1),
    checkboxGroupInput("checkGroup", 
                       label = h4("Choose the tracks you want to see: "), 
                       choices = list("Luigi Raceway" = "1 Luigi Raceway",
                                      "Moo Moo Farm" = "2 Moo Moo Farm",
                                      "Koopa Troopa Beach" = "3 Koopa Troopa Beach",
                                      "Kalimari Desert" = "4 Kalimari Desert",
                                      "Toad's Turnpike" = "5 Toad's Turnpike",
                                      "Frappe Snowland" = "6 Frappe Snowland",
                                      "Choco Mountain" = "7 Choco Mountain",
                                      "Mario Raceway" = "8 Mario Raceway",
                                      "Wario Stadium" = "9 Wario Stadium",
                                      "Sherbert Land" = "10 Sherbert Land",
                                      "Royal Raceway" = "11 Royal Raceway",
                                      "Bowser's Castle" = "12 Bowser's Castle",
                                      "DK's Jungle Parkway" = "13 DK's Jungle Parkway",
                                      "Yoshi Valley" = "14 Yoshi Valley",
                                      "Banshee Boardwalk" = "15 Banshee Boardwalk",
                                      "Rainbow Road" = "16 Rainbow Road"),
                       selected = list("1 Luigi Raceway",
                                       "10 Sherbert Land",
                                       "11 Royal Raceway",
                                       "12 Bowser's Castle",
                                       "13 DK's Jungle Parkway",
                                       "14 Yoshi Valley",
                                       "15 Banshee Boardwalk",
                                       "16 Rainbow Road",
                                       "2 Moo Moo Farm",
                                       "3 Koopa Troopa Beach",
                                       "4 Kalimari Desert",
                                       "5 Toad's Turnpike",
                                       "6 Frappe Snowland",
                                       "7 Choco Mountain",
                                       "8 Mario Raceway",
                                       "9 Wario Stadium"))

    
  ),
  mainPanel(
    h5('To view the repository for this project on github, click here ->', a("take me to github!", href="https://github.com/ibanmd/JHU_Data_Products/tree/master")),
    h5('This data set consists of 1600 races of two-player Mario Kart 64.'),
    p('This plot allows you to see the distribution of various data like points scored in a match, 
       points scored in a cup, races won in a match, and points scored in a race.
       You are able to split the data into two distributions based on the racer, by the cup, or by 
       whether the track was normal 150cc or mirrored.  You can even choose specific sets of tracks to look at.  
       There is also a slider that allows you to choose the range of matches you would like to view!'),
    h3('Density plot'),
    plotOutput('ggDensity'),
    p('It\'s probably quite clear who is the better racer...! '),
    selectInput("bestracer", label = h4("Who is the all time CHAMP ?! "), 
                choices = list("???" = "???", "Mario" = "Mario", "Peter" = "Peter"), selected = NULL),
    verbatimTextOutput('obestracer'),
    imageOutput("image2")
    )
  )
)
