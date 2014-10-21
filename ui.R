library(markdown)

shinyUI(navbarPage("Coursera Project shinyApp",
                   tabPanel("Plot",
                            sidebarLayout(
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
                                
                                helpText('Note: In the Documentation tab you will find a short summary towards how to use the shinyApp together with a description 
                                         of the mtcars dataset.')
                              ),
                              mainPanel(
                                h3(textOutput("caption")),
                                plotOutput("mpgPlot"),
                                h4(textOutput("Label")),
                                verbatimTextOutput("summary")
                              )
                            )
                   ),
                   tabPanel("Documentation",
                            helpText('USAGE: For the mtcars data set , select a variable (predictor) to show simple scatter plot against the fixed `mpg` variable. 
                              The scatter plot provides insight into the strenght of the correlation with `mpg`. To see the lineair regression line and 
                              a lineair regression summary (coefficients) click on the corresponding checkbox.'),                            
                            helpText('DATASET DESCRIPTION: The mtcars data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 
                              10 aspects of automobile design and performance for 32 automobiles (1973–74 models).'),
                            helpText('The 10 aspects:'),
                            helpText('1.  mpg - Miles/(US) gallon   2. cyl - Number of cylinders  3.  disp - Displacement (cu.in.)'),
                            helpText('4.  hp - Gross horsepower     5. drat - Rear axle ratio     6.  wt - Weight (lb/1000)'),
                            helpText('7.  qsec - 1/4 mile time      8. vs - V/S                   9.  am - Transmission (0 = automatic, 1 = manual)'),
                            helpText('10. gear - Number of forward gears                          11. carb - Number of carburetors '),
                            helpText('Output of first 5 rows of the mtcars dataset:'),
                            verbatimTextOutput("documentation")
                   )
))


























