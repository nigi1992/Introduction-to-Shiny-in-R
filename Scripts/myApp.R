### Building an app ###

library(shiny)

ui <- fluidPage(
  
  # Application Title
  titlePanel("Text Input Example"),
  
  # Sidebar panel with an input
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "text_input", label = "Text Input")
    ),
    # Main panel with output
    mainPanel(
      textOutput(outputId = "text_output")
    )  
  )
)

# Define server logic and R code to render output
server <- function(input, output) {
  output$text_output <- renderText({
    # Display text input
    paste("You typed:", input$text_input)
  })
}

shinyApp(ui = ui, server = server) # combine ui and server to launch the app


# Next App ----------------------------------------------------------------

ui2 <- fluidPage (
  
  # Application Title
  titlePanel("Kitty Freakout Counter"),
  
  # Sidebar panel with an input
  sidebarLayout(
    sidebarPanel(
      #textInput(inputId = "text_input", label = "Text Input"),
      
      # Input: Specify the number of freakouts to view ----
      numericInput(inputId = "obs", "Number of Freakouts:", 10)
    ),
    # Main panel with output
    mainPanel(
      #textOutput(outputId = "text_output")
      numericOutput(outputId = "obs", "Number of Freakouts:", 10)
    )  
  )
)

server2 <- function(input, output) {
  #output$text_output <- renderText({
  #output$numericOutput <- renderText({  
    # Display text input
    #paste("You typed:", input$text_input)
    #paste("You want to see:", input$obs, "Number of freakouts")
  output$view <- renderTable({ 
    head(datasetInput(), n = input$obs)
  })
}

# Show the first "n" observations ----
# The output$view depends on both the databaseInput reactive
# expression and input$obs, so it will be re-executed whenever
# input$dataset or input$obs is changed


shinyApp(ui = ui2, server = server2) # combine ui and server to launch the app
