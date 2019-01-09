library(shiny)
library(shinydashboard)
library(shinythemes)
library(readr)
library(ggplot2)
library(dplyr)

death_merge_rds <- readRDS(file = './death_merge.rds')

opioid_merge_rds <- readRDS(file = './Opioid_merge.rds')

state <- as.data.frame(death_merge_rds) %>% 
  select(State) %>% 
  unique()

population_2016 <- as.data.frame(death_merge_rds) %>% 
 select(Population_2016) %>% 
  unique()

population <- as.data.frame(death_merge_rds) %>% 
  select(Population) %>% 
  unique()

death_count_2016 <- as.data.frame(death_merge_rds) %>% 
  select(Deaths_2016) %>% 
  unique()

death_count <- as.data.frame(death_merge_rds) %>% 
  select(Deaths) %>% 
  unique()

rx <- opioid_merge_rds %>% 
  select(rx) %>% 
  unique()

ratio <- opioid_merge_rds %>% 
  select(Ratio) %>% 
  unique()

total_drug <- opioid_merge_rds %>% 
  select(total) %>% 
  unique()

Year <- opioid_merge_rds %>% 
  select(Year) %>% 
  unique()

Op_state <- opioid_merge_rds %>% 
  select(State) %>% 
  unique()

sort(state$State)




