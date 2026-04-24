## Group Ex ##

# number of columns in the dataset
length(europe)

# number of rows in the dataset
nrow(europe)

# number of unique countries in the dataset
length(unique(europe$Country))

# number of unique cities in the dataset
length(unique(europe$City))

# time period
range(europe$Year)

# range of temperature
range(europe$AvgTemperatureF)

# number of missing values in the dataset
sum(is.na(europe))

# show data type by column
str(europe)


## Ex. 4

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
    "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive."
  ),
  # Main panel 
  mainPanel(
  "Conclusion: Both cats and dogs have their own unique qualities that make them special and beloved pets for many people."
  )
 )
)


# Define server side logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 5

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
                  )
                  ),
    # Main panel 
    mainPanel(
      "Conclusion: Both cats and dogs have their own unique qualities that make them special and beloved pets for many people."
      )
  )
)


# Define server side logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 6

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
                  ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever")
    ),
    # Main panel 
    mainPanel(
      "Conclusion: Both cats and dogs have their own unique qualities that make them special and beloved pets for many people."
    )
  )
)


# Define server side logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 7

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
      ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever"),
      # Input: A simple text input ----
      textInput(inputId = "text_input", label = "Input text here:")
    ),
    # Main panel 
    mainPanel(
      "Conclusion: Both cats and dogs have their own unique qualities that make them special and beloved pets for many people."
    )
  )
)


# Define server side logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 8

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
                  ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever"
                  ),
      # Input: A simple text input ----
      textInput(inputId = "text_input", label = "Input text here:"
                )
    ),
    # Main panel 
    mainPanel(
      
      textOutput(outputId = "text_output")
              )
  )
)


# Define server side logic
#server <- function(input, output) {}

server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("You typed:", input$text_input)
  })
}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 9

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
      ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever"
      ),
      # Input: A simple text input ----
      textInput(inputId = "text_input", label = "A Cat makes...?"
      ),
      # Input: A simple radio button input ----
      radioButtons(inputId = "radio_1", label = "Fave Pet?",
                   choices = list("Cat" = 1, "Dog" = 2, "Both" = 3),
                   selected = 1)
    ),
    # Main panel 
    mainPanel(
      "This is the main panel",
      textOutput(outputId = "text_output")
    )
  )
)


# Define server side logic
#server <- function(input, output) {}

server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("You typed:", input$text_input)
  })
}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 10

ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
                  ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever"
                  ),
      # Input: A simple text input ----
      textInput(inputId = "text_input", label = "A Cat makes...?"
                ),
      # Input: A simple radio button input ----
      radioButtons(inputId = "radio_1", label = "Fave Pet?",
                   choices = list("Cat", "Dog", "Both"),
                   selected = "Cat")
      ),
    # Main panel 
    mainPanel(
      "This is the main panel",
      textOutput(outputId = "text_output")
              )
  )
)

# Define server side logic
server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("Your Inputs are:", input$slider_1, ",", input$select_1, ",", input$text_input, ",", input$radio_1)
  })
}

# Run the application
shinyApp(ui = ui, server = server)


## Ex. 11
?tabsetPanel
ui <- fluidPage(
  # Cats are weird
  titlePanel("Cats are weird"),
  "Cats are weird because they are cute and fluffy but also have sharp claws and can be very independent.",
  sidebarLayout(
    # Sidebar panel 
    sidebarPanel(
      "Dogs on the other hand are loyal and affectionate but can also be very protective and sometimes aggressive.\n\n",
      # Input: A simple slider ----
      sliderInput(inputId = "slider_1", label = "Cat Weirdness Level",
                  min = 1,
                  max = 10,
                  value = 5,
                  ticks = TRUE,
                  animate = TRUE,
                  step = 1
      ),
      # Input: A simple drop down list ----
      selectInput(inputId = "select_1", label = "Choose a dog breed",
                  choices = c("Labrador Retriever", "German Shepherd", "Golden Retriever", "Bulldog", "Beagle"),
                  selected = "Labrador Retriever"
      ),
      # Input: A simple text input ----
      textInput(inputId = "text_input", label = "A Cat makes...?"
      ),
      # Input: A simple radio button input ----
      radioButtons(inputId = "radio_1", label = "Fave Pet?",
                   choices = list("Cat", "Dog", "Both"),
                   selected = "Cat")
    ),
    # Main panel 
    mainPanel(
      "This is the main panel",
      textOutput(outputId = "text_output"),
      tabsetPanel(type = "tabs",
                  tabPanel(title = "Info", "Hello there"),
                  tabPanel(title = "Data", "General Kenobi"),
                  tabPanel(title = "Plots", "May the force be with you")
      )
    )
  )
)

# Define server side logic
server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("Your Inputs are:", input$slider_1, ",", input$select_1, ",", input$text_input, ",", input$radio_1)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
