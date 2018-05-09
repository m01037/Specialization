library(shiny)

########################################################

shinyServer(function(input, output, session) {
  
  USER <- reactiveValues(Logged = FALSE , session = session$user) 
  
  source("./Login.R",  local = TRUE)
  source("./rf.R",  local = TRUE)
  
 
  output$obs <- renderUI({    
    if (USER$Logged == TRUE) {      
      list(
        selectInput(inputId = "gender", label = "Select your gender:",
                    choices = c("Male", "Female"),
                    selected = "Male"),
        numericInput(inputId = "sat", 
                     label = "Enter your SAT score:", 
                     min = 200, max = 800, 
                     step = 10,
                     value = 600),
        
        sliderInput(inputId = "math",
                    label = "Select your Math score:",
                    value = 10,
                    step = 0.5,
                    min = 1,
                    max = 15),
        
        sliderInput(inputId = "percentage", 
                    label = "Select your Percentage score:", 
                    min = 1, max = 100, 
                    step = .5,
                    value = 70)#,
        
        #actionButton('calc', 'Calculate')
      )
    }                 
  })     
  
  output$congrats <- renderText({    
    if (USER$Logged == TRUE) {    
        req(input$sat)
        new.data <- data.frame(Gender = as.factor(input$gender), SAT = input$sat, Math = input$math, Percentage = input$percentage)
        levels(new.data$Gender) <- c('Female','Male')
        Prediction <- predict(rf_model, newdata = new.data)
        paste0("Based on your results we recommend that you study ", Prediction)
      }})
  
  
})