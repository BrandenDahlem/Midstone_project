library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Statistical Trends Over Time"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("split", 
                    label = "Select Variable:",
                    choices = colnames(big_table),
                    selected = 'WHIP'
                  )
      
      #sidebarPanel(
        #selectButton()
        
        
      #)
    
  
      ),
  mainPanel(plotOutput("linePlot"))  
  ),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("histo", 
                     label = "Select Team:",
                     choices = big_table$YEAR,
                     selected = '2018',
                     multiple = TRUE
      )
      
      
    ),
    mainPanel(plotOutput("hist_plot"))  
  )
  
)
)