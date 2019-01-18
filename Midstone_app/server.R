library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
 
    
  
  output$linePlot <- renderPlot({
 
    observe({print(input$slider)})
    
    measure <- input$dropdown
    
    years <- seq(input$slider[1], input$slider[2], by = 1)
    
    select_table <- big_table %>% 
      filter(Tm %in% input$group2) %>% 
      filter(YEAR %in% years) 
      
    ggplot(data = select_table, aes_string(y = measure, x = 'YEAR', group = 'Tm', col = 'Tm')) +
      geom_point(size = 3.0) +
      geom_line() +

      
      xlab('Year') +
      ylab('Statistic') +
      labs(col = 'Team')
    
    })
  
  output$hist_plot <- renderPlot({
    
    measure <- input$dropdown2
    years2 <- c('1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018')
    wins <-  big_table$wins
    
    
    histo_table <- big_table %>% 
      filter(Tm %in% input$histo) %>% 
      filter(YEAR %in% years2)
      
    
    ggplot(data = histo_table, mapping = aes_string(x = measure, color = 'Tm')) + 
      geom_histogram()
    
  })
  
})

shinyApp(shinyUI,shinyServer)