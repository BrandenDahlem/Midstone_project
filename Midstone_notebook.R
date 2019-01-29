library(tidyverse)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(scales)
library(RColorBrewer)
library(reshape2)
library(dplyr)
library(broom)

twenty_year_merge <- read.csv('~/Desktop/Midstone_project/20_year_merge_test.csv')

colnames(twenty_year_merge)[colnames(twenty_year_merge)=="Tm"] <- "Team"

colnames(twenty_year_merge)[colnames(twenty_year_merge)=="CAT"] <- "Category"

colnames(twenty_year_merge)[colnames(twenty_year_merge)=="W"] <- "Wins"

twenty_year_merge$color1 <- case_when(twenty_year_merge$Team == 'ATL' ~ 'Dark Red',
                                      twenty_year_merge$Team == 'BAL' ~ 'Orange',
                                      twenty_year_merge$Team == 'BOS' ~ 'Red',
                                      twenty_year_merge$Team == 'KCR' ~ 'Light Grey',
                                      twenty_year_merge$Team == 'LAD' ~ 'Dodgerblue',
                                      twenty_year_merge$Team == 'LgAvg' ~ 'Gold',
                                      twenty_year_merge$Team == 'MIA' ~ 'DARKTURQUOISE',
                                      twenty_year_merge$Team == 'NYY' ~ 'Navy Blue',
                                      twenty_year_merge$Team == 'PIT' ~ 'Black',
                                      twenty_year_merge$Team == 'STL' ~ 'Yellow',
                                      twenty_year_merge$Team == 'TBR' ~ 'Powderblue'
                                      
)







drops <- c('W_normalized','WHIP_normalized','SO9_normalized','PAY_normalized','SB_normalized','BA_normalized','OBP_normalized','SLG_normalized')

twenty_non_normal <- twenty_year_merge[ , !(names(twenty_year_merge) %in% drops)]

saveRDS(twenty_non_normal, file = '~/Desktop/Midstone_project/non_normal_20.rds')

readRDS('non_normal_20.rds')

twenty_year_merge$W_normalized <- ((twenty_year_merge$Wins-47)/(108-47))

twenty_year_merge$WHIP_normalized <- ((twenty_year_merge$WHIP-1.606)/(1.152-1.606))

twenty_year_merge$SO9_normalized <- ((twenty_year_merge$SO9-5.3)/(10.1-5.3))

twenty_year_merge$PAY_normalized <- ((twenty_year_merge$PAY-15.0)/(301.7-15.0))

twenty_year_merge$SB_normalized <- ((twenty_year_merge$SB-19)/(194-19))

twenty_year_merge$BA_normalized <- ((twenty_year_merge$BA-0.231)/(0.290-0.231))

twenty_year_merge$OBP_normalized <- ((twenty_year_merge$OBP-0.293)/(0.366-0.293))

twenty_year_merge$SLG_normalized <- ((twenty_year_merge$SLG-0.335)/(0.491-0.335))

top_five <- c('ATL','BOS','LAD','NYY','STL')

bottom_five <- c('BAL','KCR','MIA','PIT','TBR')

top_five_teams <- twenty_year_merge$CAT == 'TOP5'

top_five_teams <- twenty_year_merge[top_five_teams == TRUE, ]

top_five_teams

Yankees <- twenty_year_merge$Team == 'NYY'

Yankees <- twenty_year_merge[Yankees == TRUE, ]

while (!is.null(dev.list()))  dev.off()

#col <- c('#AA0000','#0000AA')[twenty_year_merge[which(twenty_year_merge$id==id), 12][1]+1]

Yankees_WHIP_plot <- ggplot() + 
  geom_line(aes(y = Yankees$WHIP_normalized, x = Yankees$YEAR),data = Yankees)

Yankees_win_plot <- ggplot() +
  geom_line(aes(y = Yankees$Wins, x = Yankees$YEAR), data = Yankees)

class(twenty_year_merge$Team) = "factor"

ten_team_WHIP_plot <- ggplot(data = twenty_year_merge, 
  aes(x = twenty_year_merge$YEAR, y = twenty_year_merge$WHIP_normalized, color = twenty_year_merge$Team)) +
                               geom_line()


ten_team_PAY_plot <- ggplot(data = twenty_year_merge, 
                             aes(x = twenty_year_merge$YEAR, y = twenty_year_merge$PAY, color = twenty_year_merge$Team)) +
  geom_line()

show(ten_team_PAY_plot)

PAY_team_plot <- ggplot(data = twenty_year_merge, 
                             aes(x = twenty_year_merge$Tm, y = twenty_year_merge$PAY, color = twenty_year_merge$CAT)) +
  geom_line()

show(PAY_team_plot)

Win_team_plot <- ggplot(data = twenty_year_merge, 
                        aes(x = PAY, color = twenty_year_merge$CAT)) +
  geom_histogram()

show(Win_team_plot)

ten_team_BA_plot <- ggplot(data = twenty_year_merge, 
                             aes(x = twenty_year_merge$YEAR, y = twenty_year_merge$BA_normalized, color = twenty_year_merge$Team)) +
  geom_line()

show(ten_team_WHIP_plot)

show(ten_team_BA_plot)

Yankees_win_plot

Yankees_WHIP_plot

ten_team_WHIP_plot

league_average <- twenty_year_merge$CAT == 'MED'

league_average <- twenty_year_merge[league_average == TRUE, ]

league_average

bottom_five_teams <- twenty_year_merge$CAT == 'BOT5'

bottom_five_teams <- twenty_year_merge[bottom_five_teams == TRUE, ]

bottom_five_teams

World_series_champs <- twenty_year_merge$WS == 'YES'

World_series_champs <- twenty_year_merge[World_series_champs == TRUE, ]

World_series_champs

saveRDS(twenty_year_merge,file = '~/Desktop/Midstone_project/Midstone_app/twenty_year_merge.rds')

readRDS('twenty_year_merge.rds')

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

Win_normal_model <- lm(twenty_year_merge$W_normalized ~ twenty_year_merge$WHIP_normalized + twenty_year_merge$SO9_normalized + twenty_year_merge$PAY_normalized + twenty_year_merge$SB_normalized + twenty_year_merge$BA_normalized + twenty_year_merge$OBP_normalized + twenty_year_merge$SLG_normalized, data = twenty_year_merge)

glance(Win_normal_model)

tidy(Win_normal_model)

Win_model <- lm(twenty_year_merge$W ~ twenty_year_merge$WHIP + twenty_year_merge$SO9 + twenty_year_merge$PAY + twenty_year_merge$SB + twenty_year_merge$BA + twenty_year_merge$OBP + twenty_year_merge$SLG, data = twenty_year_merge)

glance(Win_model)

Win_normal_model

tidy(Win_model)

twenty_year_merge

twenty_year_merge$Win_projection <- (67.799570 + (twenty_year_merge$WHIP * -94.916811) + (twenty_year_merge$SO9 * -0.747263) + (twenty_year_merge$PAY * 0.002457) + (twenty_year_merge$SB * 0.010900) + (twenty_year_merge$BA * 22.442111) + (twenty_year_merge$OBP * 264.069617) + (twenty_year_merge$SLG * 131.312993)
                   )

twenty_year_merge$deviation <- (twenty_year_merge$Win_projection- twenty_year_merge$W) /(twenty_year_merge$W) * 100

