# UI
library(shiny)
shinyUI(fluidPage(
  titlePanel("Network plot"),
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("dir", "Directory", 
                value = "/dir"),
      textInput("log", "Index of the log files", 
                value = "log"),
      sliderInput("age", "Age",
                  min = 0, max = 100, value = c(15, 75)),
      sliderInput("time", "Simulation Time",
                  min = 0, max = 15, value = c(2, 10))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("netPlot")
    )
  )
))