library(shiny)
shinyUI(navbarPage('Baseball Statistics 1999-2018',
                   theme = shinytheme('superhero'),


  tabPanel('Top/Bottom 5 Time Analysis',
  sidebarLayout(position = 'left',
    sidebarPanel(
      selectInput("dropdown", 
                    label = "Select Variable:",
                    c('Wins' = 'W',
                      'WHIP' = 'WHIP',
                      'Strikeouts/9 Innings' = 'SO9',
                      'Payroll(Millions of Dollars)' = 'PAY',
                      'Stolen Bases' = 'SB',
                      'Batting Average' = 'BA',
                      'On Base Percentage' = 'OBP',
                      'Slugging Percentage' = 'SLG'
                  )),
      
     sliderInput("slider",
                 label = "Select Year:",
                  min = 1999,
                  max = 2018,
                  value = c('1999','2018'),
                  sep = '',
                  step = TRUE
                 ),
     
     checkboxGroupInput("group2",
               label = "Select Team:",
               choices = c('Atlanta Braves' = 'ATL',
                           'Boston Red Sox' = 'BOS',
                           'Baltimore Orioles' = 'BAL',
                           'Kansas City Royals' = 'KCR',
                           'Los Angeles Dodgers' = 'LAD',
                           'Miami Marlins' = 'MIA',
                           'New York Yankees' = 'NYY',
                           'Pittsburgh Pirates' = 'PIT',
                           'St. Louis Cardinals' = 'STL',
                           'Tampa Bay Rays' = 'TBR',
                           'League Average' = 'LgAvg'
                           ),
               selected = c('NYY','BOS','LgAvg')
               )
     ),
   mainPanel(
    plotOutput("linePlot"))
  )
  ),
  
tabPanel('Top/Bottom 5 by Variable',
  sidebarLayout(
    sidebarPanel(
      
     selectInput("dropdown2", 
                 label = "Select Variable:",
                 c('Wins' = 'W',
                   'WHIP' = 'WHIP',
                   'Strikeouts/9 Innings' = 'SO9',
                   'Payroll(Millions of Dollars)' = 'PAY',
                   'Stolen Bases' = 'SB',
                   'Batting Average' = 'BA',
                   'On Base Percentage' = 'OBP',
                   'Slugging Percentage' = 'SLG'
                 ),
                 selected = 'W'),
     
     checkboxGroupInput("histo", 
                label = "Select Team:",
                 choices = c('Atlanta Braves' = 'ATL',
                           'Boston Red Sox' = 'BOS',
                             'Baltimore Orioles' = 'BAL',
                             'Kansas City Royals' = 'KCR',
                             'Los Angeles Dodgers' = 'LAD',
                             'Miami Marlins' = 'MIA',
                             'New York Yankees' = 'NYY',
                             'Pittsburgh Pirates' = 'PIT',
                             'St. Louis Cardinals' = 'STL',
                             'Tampa Bay Rays' = 'TBR',
                             'League Average' = 'LgAvg'
                             ),
                 selected = c('NYY','BOS','LgAvg'))
    ),
    mainPanel(
      plotOutput("hist_plot"))
  )
    )
)
)

