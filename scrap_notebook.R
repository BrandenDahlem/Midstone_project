ggplot(data = big_table, mapping = aes(x = c('2004':'2018'),
                                              y = big_table$WHIP, 
                                              col = c('BAL','BOS','NYY'))) + 
  geom_line()

select_table <- big_table %>% 
  filter(Tm %in% c('NYY', 'BAL', 'ATL')) %>% 
  filter(YEAR %in% c(1999:2018))

plot <- ggplot(data = select_table, aes(y = W, x = WHIP, group = Tm, color = factor(Tm))) +
  geom_point() +
  
  xlab('WHIP') +
  ylab('Wins') +
  labs(col = 'Team')
  
show(plot)

select_table

plot_59 <- ggplot(data = NULL) +
  geom_line(braves, aes(color = 'red')) +
  geom_line(yankees, aes(color = 'blue'))



show(plot_59)       


ggplot(big_table, aes(x = YEAR, y = WHIP, group = Tm)) + 
  geom_line(col = (big_table$Tm == 'NYY')) + 
  scale_x_continuous(breaks = c(1999:2018))



#scattermeasure <- input$scatterdrop

scatter_table <- big_table %>% 
  filter(YEAR %in% c(2018,2017,2016,2015))


scattered <- ggplot(scatter_table, aes(x = WHIP, y = W, group = Tm, col = Tm)) + 
  geom_point()

scattered

       