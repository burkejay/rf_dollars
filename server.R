
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
step <- readRDS("data/stepwiseModel.rds")
modelinput <- data.frame(d = 1, hr = 1, First_First_Pos="H", OPS.=100, First_Concat_pBPV=50, First_tier=3, First_C="C", First_E="C", First_Age=30)

shinyServer(function(input, output) {
  
  fantasyBaseballDollars <- function(age, postype, bpv) {
    modelinput$First_Age <- age
    modelinput$First_First_Pos <- postype
    modelinput$First_Concat_pBPV <- bpv
    predict(step,modelinput)
  }

  output$age <- renderPrint({input$age})
  output$positiontype <- renderPrint({ input$positiontype })
  output$bpv <- renderPrint({ input$BPV })
  output$prediction <- renderPrint({fantasyBaseballDollars(input$age, input$positiontype, input$BPV)})
  
})
