shinyUI(
  fluidPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
          fluidRow(
            box(
                    title = "State", status = "primary", width=2,
                    selectInput("state", 
                          label = "Please Select a State Below:", 
                          choices = state,
                          selected = 'TN')
        )
        ,
        
        fluidRow(
          box(
            title = "Opioid Prescriptions, 2014 and 2016", status = "primary", solidHeader = TRUE,
            plotOutput("drugbars", height = 600, width = 720)
          )
        )
      )    
    )
  )
)
