
# Loading europe dataset

library(dplyr)

# remove europe column from europe dataset
europe <- europe %>% select(-Region)

library(shiny)
library(tidyverse)
library(shiny)

?sliderInput
unique(europe$Country)

unique(europe$City)

# Fahrenheit to Celsius Conversion
europe <- europe %>% mutate(AvgTemperatureC = (AvgTemperatureF - 32) * 5/9)

# Round to 2 decimal places
europe <- europe %>% mutate(AvgTemperatureC = round(AvgTemperatureC, 2))


# Plot --------------------------------------------------------------------

# Change of temperature in Tirana, Albania across time
library(ggplot2)

tirana_df <- europe %>% filter(Country == "Albania", City == "Tirana")

line_plot <- tirana_df %>%
  group_by(Date) %>%
  arrange(desc(AvgTemperatureC)) %>%
  slice(1) %>%
  ungroup()
  
ggplot(tirana_df, aes(x = Date, y = AvgTemperatureC)) +
  geom_line() +
  labs(title = "Avg. Temperature (C) in Tirana, Albania across time",
       x = "Date",
       y = "Temperature (C)")

ggplot(tirana_df, aes(x = Date, y = AvgTemperatureC, color = AvgTemperatureC)) +
  geom_line() +
  scale_color_gradient2(low = "blue", mid = "green", high = "red", midpoint = 15) +
  labs(title = "Avg. Temperature (C) in Tirana, Albania across time",
       x = "Date",
       y = "Temperature (C)",
       color = "Temp (C)")


# App ---------------------------------------------------------------------


ui <- fluidPage(
  # title panel
  titlePanel("Temperature in European Cities across Time"),
  
    sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
    "Choose different inputs to explore the data",
            # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Date",
                  min = europe$Date %>% min(),
                  max = europe$Date %>% max(),
                  value = europe$Date %>% min(),
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
      ),
      
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Country",
                  choices = europe$Country %>% unique(),
                  selected = "Albania"
      ),
      
      # Input: B simple drop down list ----
      selectInput(inputId = "select_2", label = "City",
                  choices = europe$City %>% unique(),
                  selected = "Tirana"
      ),
      
    ),
    # Main panel 
    mainPanel(
      "This is the main panel",
      textOutput(outputId = "text_output"),
      tableOutput(outputId = "table_output"),
      dataTableOutput(outputId = "data_table_output"),
      tabsetPanel(type = "tabs",
                  tabPanel(title = "Info", "This is the info tab"),
                  tabPanel(title = "Data", "This is the Data Tab"),
                  tabPanel(title = "Plots", "Plot Tab")
      )
    )
  )
)

# Define server side logic
server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("Your Inputs are:", input$slider_1, ",", input$select_1, ",", input$select_2)
  })
  # Output: Render a print output ----
  #output$data_summary <- renderPrint({
   # summary(europe)
  #})
  # Output: Render a (dynamic) table output ----
  output$table_output <- renderDataTable({
    europe
  })
  # Output: Render a (dynamic) table output ----
  output$data_table_output <- renderDataTable({
    europe
  })
}

# Run the application
shinyApp(ui = ui, server = server)


# Template Parts ----------------------------------------------------------

# UI Output Functions
verbatimTextOutput("data_summary")
plotOutput("barplot")
dataTableOutput("data_table")
plotOutput("lineplot")
plotOutput("boxplot")

# Server Logic
# Define server side logic
server <- function(input, output) {
  # Output: Render a text output ----
  output$text_output <- renderText({
    paste("Your inputs are:", input$slider_1, input$drop_down_1, input$text_input, input$radio_1)
  })
  # Output: Render a print output ----
  output$data_summary <- renderPrint({
    summary(demo_data)
  })
  # Output: Render a plot output ----
  output$barplot <- renderPlot({
    ggplot(data = barplot_df) +
      geom_bar(mapping = aes(x = Year, fill = Status)) +
      ylab("Number of Storms")
  })
  # Output: Render a (dynamic) table output ----
  output$data_table <- renderDataTable({
    storm_df
  })
  # Output: Render a plot output ----
  output$lineplot <- renderPlot({
    ggplot(data = lineplot_df) +
      geom_line(mapping = aes(x = Date, y = Wind), size = 3) +
      ylab("Wind speed (knots)")
  })
  # Output: Render a plot output ----
  output$boxplot <- renderPlot({
    ggplot(data = storm_df) +
      geom_boxplot(mapping = aes(x = Date, y = Wind, group = Date), size = 1)
  })
}

# UI part
# Main panel mainPanel(
"This is the main panel",
textOutput(outputId = "text_output"),
# Layout: Tabset with info, data, and plots tabs ----
tabsetPanel(type = "tabs",
            tabPanel(title = "Info",
                     "This is the demo shiny app. It is created during the course demonstrations and explanations using the demo data: Wind speed (in knots) and air pressure (in millibars) of storms from around the world from 1975 to 2015",
                     verbatimTextOutput("data_summary")
            ),
            tabPanel(title = "Data",
                     dataTableOutput("data_table")
            ),
            tabPanel(title = "Plots",
                     plotOutput("barplot"),
                     plotOutput("lineplot"),
                     plotOutput("boxplot")
            )
)
)
