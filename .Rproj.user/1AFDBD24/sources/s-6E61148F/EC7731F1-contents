
shinyServer(function(input, output) {
  
  output$drugbars <- renderPlot({
    
    # filter drug_counts dataset by the state selected
    
opioid_merge_rds <- opioid_merge_rds %>%
      filter(State == input$state)
    
    # create plot from filtered data
    ggplot(data = opioid_merge_rds, aes(x = rx, y = total, col = Year)) + 
      geom_col(position = 'dodge') + 
      coord_flip() +
      facet_grid(Year ~.) +
      labs(x = "Drug Prescribed", y = "Total Count") + 
      theme(axis.text.x = element_text(size = 5, angle = 45, hjust = 1)) + 
      ggtitle('Opioid Prescriptions by State, 2014 vs. 2016')
    
  })
})