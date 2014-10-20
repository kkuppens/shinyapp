library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Simple Lineair Regression Analysis, Miles Per Gallon"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and with checkbox for displaying lineair regression information.
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

    helpText('Note: For the mtcars data, select a variable (predictor) to show simple scatter plot against the fixed `mpg` variable. 
             The scatter plot provides insight into the strenght of the correlation with `mpg`. To see the lineair regression line and 
             a lineair regression summary (coefficients) click on the checkbox above.')
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mpgPlot"),
    verbatimTextOutput("summary")
  )
))
