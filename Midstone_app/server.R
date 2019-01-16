library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  output$linePlot <- renderPlot({

    ggplot(data = big_table, mapping = aes_string(x = 'YEAR' , y = input$split, col = 'Tm')) + geom_line()
   
    })
  
  output$hist_plot <- renderPlot({
    
    ggplot(data = big_table, mapping = aes_string(y = input$split, x = input$histo)) + geom_point(stat = 'identity')
    
  })
  
})