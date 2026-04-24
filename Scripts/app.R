library(shiny)

ui <- fluidPage(textInput(inputId = "name",
                          label = "What is Shiny?"))

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


