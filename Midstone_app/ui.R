library(shiny)
shinyUI(navbarPage('Baseball Statistics 1999-2018',
                   theme = shinytheme('superhero'),


  tabPanel('Time Analysis by Team',
  sidebarLayout(position = 'left',
    sidebarPanel(
      p(h3('Team Comparisons, 1999-2018')
        ,h6('Data sourced from :"https://www.baseball-reference.com/leagues/MLB/"
      And "https://www.spotrac.com/mlb/payroll/"')),
      selectInput("dropdown", 
                    label = "Select Variable:",
                    c('Wins' = 'W',
                      'WHIP' = '-WHIP',
                      'Strikeouts/9 Innings' = 'SO9',
                      'Payroll(Millions of Dollars)' = 'PAY',
                      'Stolen Bases' = 'SB',
                      'Batting Average' = 'BA',
                      'On Base Percentage' = 'OBP',
                      'Slugging Percentage' = 'SLG'),
                  selected = 'SO9'
                  ),
      
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
                           'Baltimore Orioles' = 'BAL',
                           'Boston Red Sox' = 'BOS',
                           'Kansas City Royals' = 'KCR',
                           'Los Angeles Dodgers' = 'LAD',
                           'League Average' = 'LgAvg',
                           'Miami Marlins' = 'MIA',
                           'New York Yankees' = 'NYY',
                           'Pittsburgh Pirates' = 'PIT',
                           'St. Louis Cardinals' = 'STL',
                           'Tampa Bay Rays' = 'TBR'
                           ),
               selected = c('BOS','KCR','LAD','LgAvg','MIA','NYY','STL')
               )
    ),
   mainPanel(
     br(),
     br(),
     br(),
     br(), br(),
    plotOutput("linePlot"))
  )
  ),
  
tabPanel('Top 5/Bottom 5 Time Analysis',
  sidebarLayout(
    sidebarPanel(
      p(h3('Team comparisons categorized by top and bottom 5 lists,    1999-2018')
        ,h6('Data sourced from :"https://www.baseball-reference.com/leagues/MLB/"
            And "https://www.spotrac.com/mlb/payroll/"')),
      selectInput("dropdown2", 
                 label = "Select Variable:",
                 c('Wins' = 'W',
                   'WHIP' = '-WHIP',
                   'Strikeouts/9 Innings' = 'SO9',
                   'Payroll(Millions of Dollars)' = 'PAY',
                   'Stolen Bases' = 'SB',
                   'Batting Average' = 'BA',
                   'On Base Percentage' = 'OBP',
                   'Slugging Percentage' = 'SLG'
                 ),
                 selected = 'SO9'),
      sliderInput("slider2",
                  label = "Select Year:",
                  min = 1999,
                  max = 2018,
                  value = c('1999','2018'),
                  sep = '',
                  step = TRUE
      ),
     
     checkboxGroupInput("histo1", 
                label = "All Teams:",
                 choices = c('Atlanta Braves(Top 5)' = 'ATL',
                             'Boston Red Sox(Top 5)' = 'BOS',
                             'Los Angeles Dodgers(Top 5)' = 'LAD',
                             'New York Yankees(Top 5)' = 'NYY',
                             'St. Louis Cardinals(Top 5)' = 'STL',
                             'League Average' = 'LgAvg',
                             'Baltimore Orioles(Bottom 5)' = 'BAL',
                             'Kansas City Royals(Bottom 5)' = 'KCR',
                             'Miami Marlins(Bottom 5)' = 'MIA',
                             'Pittsburgh Pirates(Bottom 5)' = 'PIT',
                             'Tampa Bay Rays(Bottom 5)' = 'TBR'
                             ),
                 selected = c('NYY','BOS','BAL','KCR','LAD','TBR'))
     ),  
  mainPanel(
    br(),
    br(),
    br(),
    br(), br(),
      plotOutput("hist_plot"))
  )
),

tabPanel('Statistic vs. Win Scatterplot',
       sidebarLayout(position = 'left',
                      sidebarPanel(
                        p(h3('Scatterplot displaying relationship between wins and the other variables')
                          ,h6('Data sourced from :"https://www.baseball-reference.com/leagues/MLB/"
                              And "https://www.spotrac.com/mlb/payroll/"')),
                        selectInput("scatterdrop", 
                                               label = "Select Comparison:",
                                               c('WHIP vs. Wins' = '-WHIP',
                                                 'Strikeouts/9 Innings vs. Wins' = 'SO9',
                                                 'Payroll(Millions of Dollars) vs. Wins' = 'PAY',
                                                 'Stolen Bases vs. Wins' = 'SB',
                                                 'Batting Average vs. Wins' = 'BA',
                                                 'On Base Percentage vs. Wins' = 'OBP',
                                                 'Slugging Percentage vs. Wins' = 'SLG'),
                                               selected = 'SO9'
                                    ),
                        
                       selectInput("scatteryear", 
                                    label = "Select Year:",
                                    choices = c('2018' = 2018,
                                                '2017' = 2017,
                                                '2016' = 2016,
                                                '2015' = 2015,
                                                '2014' = 2014,
                                                '2013' = 2013,
                                                '2012' = 2012,
                                                '2011' = 2011,
                                                '2010' = 2010,
                                                '2009' = 2009,
                                                '2008' = 2008,
                                                '2007' = 2007,
                                                '2006' = 2006,
                                                '2005' = 2005,
                                                '2004' = 2004,
                                                '2003' = 2003,
                                                '2002' = 2002,
                                                '2001' = 2001,
                                                '2000' = 2000,
                                                '1999' = 1999),
                                    selected = c('1999':'2018'),
                                    multiple = TRUE
                                    ),
                       selectInput("scatterteam", 
                                   label = "Select Team:",
                                   choices = c('Atlanta Braves' = 'ATL',
                                               'Baltimore Orioles' = 'BAL',
                                               'Boston Red Sox' = 'BOS',
                                               'Kansas City Royals' = 'KCR',
                                               'Los Angeles Dodgers' = 'LAD',
                                               'League Average' = 'LgAvg',
                                               'Miami Marlins' = 'MIA',
                                               'New York Yankees' = 'NYY',
                                               'Pittsburgh Pirates' = 'PIT',
                                               'St. Louis Cardinals' = 'STL',
                                               'Tampa Bay Rays' = 'TBR'
                                               ),
                                   selected = c('BOS','KCR','LAD','NYY','PIT','STL'),
                                   multiple = TRUE
                       )
           ),
  mainPanel(
    br(),
    br(),
     plotOutput('scatter_plot'))
)
),
tabPanel('Data Table',
mainPanel(
  dataTableOutput('table')))
)
)