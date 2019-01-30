library(shiny)
library(ggplot2)
library(shinythemes)
library(magrittr)
library(dplyr)

shinyServer(function(input, output) {
 
    
  
  output$linePlot <- renderPlot({
     
   measure <- input$dropdown
    
    years <- seq(input$slider[1], input$slider[2], by = 1)
    
    select_table <- big_table %>% 
      dplyr::filter(Team %in% input$group2) %>% 
      dplyr::filter(YEAR %in% years) 
      
    ggplot(data = select_table, aes_string(y = measure, x = 'YEAR', group = 'Team', col = 'color1')) +
      scale_color_identity(labels = Team_list, breaks = Color_list, guide = 'legend', aesthetics = c('color')) +
      theme(axis.title.x = element_text(size = 22.0, face = 'bold',family = 'Arial')) +
      theme(axis.title.y = element_text(size = 22.0, face = 'bold',family = 'Arial')) +
      theme(axis.text.x = element_text(size = 22.0, angle = 45, vjust = 0.6)) +
      theme(axis.text.y = element_text(size = 22.0)) +
      theme(legend.text.align = 0.1) +
      theme(legend.title = element_text(size = 22.0, face = 'bold', family = 'Arial')) +
      theme(legend.text = element_text(size = 15.0)) +
      theme(panel.border = element_rect(colour = "light grey", fill=NA, size=5)) +
      theme(plot.background = element_rect(color = 'dark grey', fill = 'light grey', size = 2)) +
      geom_point(size = 2.0) +
      geom_line() +
     

      
      xlab('Year') +
      ylab('Selected Stat') +
      labs(col = 'Team')
    
    })
  
  output$hist_plot <- renderPlot({
 
   measure2 <- input$dropdown2
   
   years2 <- seq(input$slider2[1], input$slider2[2], by = 1)

    
    histo_table <- big_table %>% 
      dplyr::filter(Team %in% input$histo1) %>% 
      dplyr::filter(YEAR %in% years2)
    
   ggplot(data = histo_table, aes_string(y = measure2, x = 'YEAR', group = 'Team', col = 'Category')) +
      theme(axis.title.x = element_text(size = 22.0, face = 'bold',family = 'Arial')) +
      theme(axis.title.y = element_text(size = 22.0, face = 'bold',family = 'Arial')) +
      theme(axis.text.x = element_text(size = 22.0, angle = 45, vjust = 0.6)) +
      theme(axis.text.y = element_text(size = 22.0)) +
      theme(legend.text.align = 0.1) +
      theme(legend.title = element_text(size = 22.0, face = 'bold', family = 'Arial')) +
      theme(legend.text = element_text(size = 15.0)) +
      theme(panel.border = element_rect(colour = "light grey", fill=NA, size=5)) +
      theme(plot.background = element_rect(color = 'dark grey', fill = 'light grey', size = 2)) +
      geom_point(size = 3.0) +
      geom_line() +
      guides(color = guide_legend(reverse=T)) +
      
      
      xlab('Year') +
      ylab('Selected Stat') +
      labs(col = 'Category')
    
    
  })
  
 output$scatter_plot <- renderPlot({
   
  scattermeasure <- input$scatterdrop
  
  scatter_table <- big_table %>% 
      dplyr::filter(YEAR %in% input$scatteryear) %>% 
      dplyr::filter(Team %in% input$scatterteam)
   
   ggplot(scatter_table, aes_string(y = 'Wins', x = scattermeasure, group = 'Team', col = 'color1')) +
     scale_color_identity(labels = Team_list, breaks = Color_list, guide = 'legend', aesthetics = c('color')) +
     theme(axis.title.x = element_text(size = 22.0, face = 'bold',family = 'Arial')) +
     theme(axis.title.y = element_text(size = 22.0, face = 'bold', family = 'Arial')) +
     theme(axis.text.x = element_text(size = 22.0)) +
     theme(axis.text.y = element_text(size = 22.0, face = 'italic')) +
     theme(legend.text.align = 0.1) +
     theme(legend.title = element_text(size = 22.0, face = 'bold')) +
     theme(legend.text = element_text(size = 15.0)) +
     theme(panel.border = element_rect(colour = "light grey", fill=NA, size=5)) +
     theme(plot.background = element_rect(color = 'dark grey', fill = 'light grey', size = 2)) +
     geom_point(size = 4.0) +
     
     
     xlab('Selected Stat') +
     ylab('Wins') +
     labs(col = 'Team')
   
 
   
   
   
 })
  
 output$table <- renderDataTable(non_normal_table, options = list(pageLength = 11))
 
 
})

shinyApp(shinyUI,shinyServer)