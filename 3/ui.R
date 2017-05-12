library(leaflet)

# Choices for drop-downs
vars <- c(
  "2016" = "2016 pollution",
  "2010" = "2010 pollution",
  "2005" = "2005 pollution",
  "2000" = "2000 pollution",
  "1995" = "1995 pollution"
)

#Choice for the second drop down


server = (function(input, output) {
  
  output$text <- renderText({  
    paste("You have selected:",input$vars)
  })  
  
  
  input$var;
  
  
})

navbarPage("Pollution Data", id="nav",

  tabPanel("Interactive map",
    div(class="outer",

      tags$head(
        # Include our custom CSS
        includeCSS("styles.css"),
        includeScript("gomap.js")
      ),

      leafletOutput("map", width="100%", height="100%"),

      # Shiny versions prior to 0.11 should use class="modal" instead.
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
        draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
        width = 330, height = "auto",

        h2("Ozone concentration(ppm) in the US"),

        selectInput("color", "Year", vars),
       #selectInput("size", "Size", vars, selected = "adultpop"),
        conditionalPanel("input.color == 'superzip' ",
          # Only prompt for threshold when coloring or sizing by superzip
          numericInput("threshold", "SuperZIP threshold (top n percentile)", 5)
        )
      ,

        plotOutput("histCentile", height = 200),
        plotOutput("scatterCollegeIncome", height = 250)
      ),

      tags$div(id="cite",
        'Data compiled for ', tags$em('Ozone concentration(ppm) in the US, 1995–2016')
      )
    )
  ),

  # tabPanel("Data explorer",
  #   fluidRow(
  #     column(3,
  #       selectInput("states", "States", c("All states"="", structure(state.abb, names=state.name), "Washington, DC"="DC"), multiple=TRUE)
  #     ),
  #     column(3,
  #       conditionalPanel("input.states",
  #         selectInput("cities", "Cities", c("All cities"=""), multiple=TRUE)
  #       )
  #     ),
  #     column(3,
  #       conditionalPanel("input.states",
  #         selectInput("ardaeraodes", "Zipcodes", c("All zipcodes"=""), multiple=TRUE)
  #       )
  #     )
  #   ),
  #   fluidRow(
  #     column(1,
  #       numericInput("minScore", "Min score", min=0, max=100, value=0)
  #     ),
  #     column(1,
  #       numericInput("maxScore", "Max score", min=0, max=100, value=100)
  #     )
  #   ),
  #   hr(),
  #   DT::dataTableOutput("ziptable")
  # ),

  conditionalPanel("false", icon("crosshair"))
)
