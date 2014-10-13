# UI
library(shiny)
shinyUI(fluidPage(
  titlePanel("HIV Prevalence"),
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(

      sliderInput("age", "Age",
                  min = 0, max = 100, value = c(15, 75)),
      sliderInput("time", "Simulation Time",
                  min = 0, max = 15, value = c(2, 10)),
      checkboxGroupInput("gender", "Gender",
                         choices = list("Males" = 1, 
                                        "Females" = 2),
                         selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("prevPlot")
    )
  )
))