ggplot(data = big_table, mapping = aes(x = c('2004':'2018'),
                                              y = big_table$WHIP, 
                                              col = c('BAL','BOS','NYY'))) + 
  geom_line()

select_table <- big_table %>% 
  filter(Tm %in% c('NYY', 'BAL', 'ATL')) %>% 
  filter(YEAR %in% c(1999:2018))

plot <- ggplot(data = select_table, aes(y = SO9, x = YEAR, group = Tm, color = factor(Tm))) +
  geom_line() +
  
  xlab('Year') +
  ylab('Statistic') +
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

       