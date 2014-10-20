library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Simple Lineair regression, predicting Miles Per Gallon"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Predictor:",
                list("Cylinders" = "cyl", 
                     "Displacement" = "disp",
                     "Horsepower" = "hp",
                     "Rear axle ratio" = "drat",
                     "Weight lb/1000" = "wt",
                     "qsec" = "qsec",
                     "V/S" = "vs",
                     "Transmission" = "am",
                     "Gears" = "gear",
                     "Carberators" ="carb")),
    
    checkboxInput("regression", "Show Lineair regression line and information", FALSE),

    helpText('Note: For the mtcars data, we can select variables (predictor) to show simple scatter plot and lineair regression against the mpg variable (outcome);
             the scatter plot itself provides insight into the correlation of the selected variable against mpg. To see the lineair regression line and a summary click on the checkbox above.')
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mpgPlot"),
    verbatimTextOutput("summary")
  )
))
