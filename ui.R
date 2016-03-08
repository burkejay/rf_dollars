
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Fantasy Baseball Value Prediction"),
  
  # Sidebar with a slider input for age
  sidebarPanel(
    sliderInput("age",
                "Age:",
                min = 20,
                max = 50,
                value = 30),

    sliderInput("BPV",
                "Base Performance Value:",
                min = 0,
                max = 200,
                value = 70),
    
    radioButtons("positiontype", label = h3("Position Type:"), 
                       choices = list("Hitter" = "H", "Pitcher" = "P"),
                       selected = "H", inline=TRUE)
  ),
  
  # Show input and output of model
  mainPanel(
    h3("Results of Prediction"),
    h4("You entered an age of "),
    verbatimTextOutput("age"),
    h4("You entered a position of "),
    verbatimTextOutput("positiontype"),
    h4("You entered a Base Performance Value of "),
    verbatimTextOutput("bpv"),
    h4("Which resulted in a prediction of "),
    verbatimTextOutput("prediction")
    )
))
