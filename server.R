library(ggplot2)
library(shiny)
library(datasets)
data(mtcars)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is 
  # shared by the output$caption expression
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  #Compute the linear regression it is shared by the output$summary expression
  output$summary <- renderPrint({
    if(input$regression==TRUE)
    {
      x <- paste0("mpg ~",input$variable)
      fit<-lm(x,data=mtcars)
      summary(fit)$coef
    }
  })
   
  # Generate a scatter plot of the requested variable against mpg and  
  # display lineair regression in case of selected checkbox.
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
