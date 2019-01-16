if (interactive()) {

library(shiny)
library(shinydashboard)
library(shinythemes)
library(readr)
library(ggplot2)
library(dplyr)
library(broom)

big_table <- readRDS("~/Desktop/Midstone_project/twenty_year_merge.rds")

top_five <- big_table %>% 
              filter(big_table$CAT == 'TOP5')

bottom_five <- big_table %>% 
              filter(big_table$CAT == 'BOT5')

league_average <- big_table %>% 
                filter(big_table$CAT == 'MED')

world_series <- big_table %>% 
                filter(big_table$WS == 'YES')

}