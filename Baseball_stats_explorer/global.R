library(shiny)
library(shinydashboard)
library(shinythemes)
library(readr)
library(magrittr)
library(ggplot2)
library(dplyr)
library(broom)
library(assertive, warn.conflicts = FALSE)
  

big_table <- readRDS("./twenty_year_merge.rds")

non_normal_table <- readRDS("./non_normal_20.rds")

Team_list <- c('Atlanta Braves', 'Baltimore Orioles', 'Boston Red Sox', 'Kansas City Royals', 'Los Angeles Dodgers', 'League Average', 'Miami Marlins', 'New York Yankees', 'Pittsburgh Pirates', 'St. Louis Cardinals', 'Tampa Bay Rays')

Color_list <- c('Dark Red', 'Orange', 'Red', 'Light Grey', 'Dodgerblue', 'Gold', 'DARKTURQUOISE', 'Navy Blue', 'Black', 'Yellow', 'Powderblue')

Category_list <- c('Top 5 Teams', 'League Average', 'Bottom 5 Teams')

Cat_color_list <- c('Green', 'Yellow', 'Red')