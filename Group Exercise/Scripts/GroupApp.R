library(shiny)

# Template

# Define UI for application
ui <- fluidPage(
  # Application title
  titlePanel("Title goes here"),
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
    
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Slider Label",
                  min = 1,
                  max = 100,
                  value = 50,
                  ticks = FALSE)  
      
    ),
    # Main panel
    mainPanel(
    )
  )
)

# Define server side logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)

?sliderInput


### Demo

library(dplyr) # Package for data manipulations
library(magrittr) # Package for pipe operator
library(ggplot2) # Package for creating graphs

demo_data <- readRDS("data/demo_data.rds") # Load the demo data

# Create a data summary print object
summary(demo_data)

# Create a bar plot of the number of storms per year
barplot_df <- demo_data %>%
  group_by(Name, Year) %>% # Identify unique Name+Year combinations of storms and group
  arrange(desc(Date)) %>% # Place the latest date of group to the top
  slice(1) %>% # Keep top row for each group
  ungroup()

ggplot(data = barplot_df) +
  geom_bar(mapping = aes(x = Year, fill = Status)) +
  ylab("Number of Storms")
  
                       
# Create a data frame with the 2005 “Katrina” hurricane data

storm_df <- demo_data %>%
  filter(Name == c("Katrina")) %>% # Subset the rows for specific storm Name
  filter(Year == c(2005)) # Subset the rows for specific storm year

# Create a line plot for the 2005 “Katrina” hurricane using the Wind speed variable
lineplot_df <- storm_df %>%
  group_by(Name, Date) %>% # Group the data by date as there are multiple obs per date
  arrange(desc(Wind)) %>% # Place the row with highest wind speed on the top
  slice(1) %>% # Keep top row for each group
  ungroup()

ggplot(data = lineplot_df) +
  geom_line(mapping = aes(x = Date, y = Wind), size = 3) +
  ylab("Wind speed (knots)")
                          
  # Create a box plot for the 2005 “Katrina” hurricane using the Wind speed variable
ggplot(data = storm_df) +
  geom_boxplot(mapping = aes(x = Date, y = Wind, group = Date), size = 1)                         


### Demo Shiny App

library(shiny) # Package for shiny applications
library(dplyr) # Package for data manipulations
library(magrittr) # Package for pipe operator
library(ggplot2) # Package for creating graphs

demo_data <- readRDS("data/demo_data.rds") # Load the demo data

barplot_df <- demo_data %>%
  filter(Year >= 1900) %>% # Subset the rows to keep storms more than or equal to a year
  filter(Status == "hurricane") %>% # Subset the rows to keep a specific storm status
  group_by(Name, Year) %>% # Identify unique Name+Year combinations of storms and group
  arrange(desc(Date)) %>% # Place the latest date of group to the top
  slice(1) %>% # Keep top row for each group
  ungroup()

storm_df <- demo_data %>%
  filter(Name == "Katrina") %>% # Subset the rows for specific storm Name
  filter(Year == 2005) # Subset the rows for specific storm year

lineplot_df <- storm_df %>%
  group_by(Name, Date) %>% # Group the data by date as there are multiple obs per date
  arrange(desc(Wind)) %>% # Place the row with highest wind speed on the top
  slice(1) %>% # Keep top row for each group
  ungroup()


# Render Functions
output$data_summary <- renderPrint({
  summary(demo_data)
})
output$barplot <- renderPlot({
  ggplot(data = barplot_df) +
    geom_bar(mapping = aes(x = Year, fill = Status)) +
    ylab("Number of Storms")
})
output$data_table <- renderDataTable({
  storm_df
})
output$lineplot <- renderPlot({
  ggplot(data = lineplot_df) +
    geom_line(mapping = aes(x = Date, y = Wind), size = 3) +
    ylab("Wind speed (knots)")
})
output$boxplot <- renderPlot({
  ggplot(data = storm_df) +
    geom_boxplot(mapping = aes(x = Date, y = Wind, group = Date), size = 1)
})

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
  # Reactive Expression
  output$text_output <- renderText({
    text()
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