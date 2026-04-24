library(shiny)

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
