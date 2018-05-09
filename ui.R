shinyUI(
  fluidPage(
    headerPanel("Specialization Recommendation Engine"),
    
    tagList(
      tags$head(
        tags$link(rel="stylesheet", type="text/css",href="style.css")
      )
    ),
    br(),
    br(),
    br(),
    br(),
    
    div(class = "login",
        uiOutput("uiLogin"),
        textOutput("pass"),
        tags$head(tags$style("#pass{color: red;"))
    ),    
    
    fluidRow(
      column(3,
             div(class = "span1",      
                 uiOutput("obs")
             )
      ),
      column(8,
             div(class = "logininfo",
                 uiOutput("userPanel")
             ),
             hr(),
             div(class = "congrats",      
                 uiOutput('congrats')
             )     
      )
    )
    
    
  )
)
