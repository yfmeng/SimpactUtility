# UI
library(shiny)
shinyUI(fluidPage(
  titlePanel("Toy Simpact Model"),
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(

      numericInput("nmen", "Number of males", 
                   value = 50),
      numericInput("nwomen", "Number of females", 
                   value = 50),
      numericInput("form.base", "Baseline of formation", 
                   value = -1),
      numericInput("dis.base", "Baseline of dissolution", 
                   value = 0.5),
      numericInput("seed.frac", "HIV seeds fraction", 
                   value = 0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("toyPlot")
    )
  )
)
)