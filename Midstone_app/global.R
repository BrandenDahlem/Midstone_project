if (interactive()) {

library(shiny)
library(shinydashboard)
library(shinythemes)
library(readr)
library(ggplot2)
library(dplyr)
library(broom)

big_table <- readRDS("~/Desktop/Midstone_project/Midstone_app/twenty_year_merge.rds")

non_normal_table <- readRDS("~/Desktop/Midstone_project/non_normal_20.rds")

Team_list <- c('Atlanta Braves', 'Baltimore Orioles', 'Boston Red Sox', 'Kansas City Royals', 'Los Angeles Dodgers', 'League Average', 'Miami Marlins', 'New York Yankees', 'Pittsburgh Pirates', 'St. Louis Cardinals', 'Tampa Bay Rays')

Color_list <- c('Dark Red', 'Orange', 'Red', 'Light Grey', 'Dodgerblue', 'Gold', 'DARKTURQUOISE', 'Navy Blue', 'Black', 'Yellow', 'Powderblue')

Category_list <- c('Top 5 Teams', 'League Average', 'Bottom 5 Teams')

Cat_color_list <- c('Green', 'Yellow', 'Red')

}