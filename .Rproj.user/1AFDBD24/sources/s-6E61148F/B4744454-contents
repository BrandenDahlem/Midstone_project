library(tidyverse)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(scales)
library(RColorBrewer)
library(reshape2)

data_2018 <- read.csv('~/2018_baseball_data.csv')

MLB_teams <- read_csv('~/Downloads/baseballdatabank-master/upstream/Teams.csv')

MLB_teams

Team_wins_20 <- read_csv('~/Downloads/Team_wins_20_years')

Team_wins_20

head(Team_wins_20)

Team_win_totals <- colSums(Team_wins_20)

Team_win_totals

sort(Team_win_totals)

plot(Team_win_totals)

Win_percentage_totals <- Team_win_totals/3409

Win_percentage_totals

sort(Win_percentage_totals)

sort(Win_percentage_totals * 162)

plot(Win_percentage_totals * 162)

Team_wins_20$RowTotal <- (rowSums(Team_wins_20) - (Team_wins_20$G + Team_wins_20$Year))

Team_wins_20$AvgWin <- Team_wins_20$RowTotal / 30

Team_wins_20
