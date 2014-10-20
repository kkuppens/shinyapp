library(ggplot2)
library(shiny)
library(datasets)
data(mtcars)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  #Cumpute the linear regression it is shared by the output$regression expressions
  #regressionText <- reactive({
  #  ""
  #})
  
  output$summary <- renderPrint({
    if(input$regression==TRUE)
    {
      x <- paste0("mpg ~",input$variable)
      fit<-lm(x,data=mtcars)
      summary(fit)$coef
    }
  })
   
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    if (input$variable == "am")
    { 
      p <- ggplot(mtcars, aes(am,mpg)) + geom_point()
        if (input$regression == TRUE) 
          p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "cyl")
    { 
      p <- ggplot(mtcars, aes(cyl,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "disp")
    { 
      p <- ggplot(mtcars, aes(disp,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "hp")
    { 
      p <- ggplot(mtcars, aes(hp,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "drat")
    { 
      p <- ggplot(mtcars, aes(drat,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "wt")
    { 
      p <- ggplot(mtcars, aes(wt,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "qsec")
    { 
      p <- ggplot(mtcars, aes(qsec,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "vs")
    { 
      p <- ggplot(mtcars, aes(vs,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "gear")
    { 
      p <- ggplot(mtcars, aes(gear,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    if (input$variable == "carb")
    { 
      p <- ggplot(mtcars, aes(carb,mpg)) + geom_point()
      if (input$regression == TRUE) 
        p <- p + geom_smooth(method="lm") 
    }
    p  
  })
})
