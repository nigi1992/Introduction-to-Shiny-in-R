### Day 1 ###

## Install packages
install.packages("tidyverse")
install.packages("shiny")
install.packages("shinythemes")

# Load packages
library(tidyverse)
library(shiny)
library(shinythemes)


# Demonstrations

# Basic Structure of Shiny App
ui <- fluidPage(textInput(inputId = "name",
                          label = "What is Shiny?"))

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


# in built examples

# display mode on 
runExample(example = "01_hello", display.mode = "showcase")

runExample(example = "02_text", display.mode = "showcase")

runExample(example = "03_reactivity", display.mode = "showcase")

runExample(example = "05_sliders", display.mode = "showcase")

runExample(example = "06_tabsets", display.mode = "showcase")

runExample(example = "07_widgets", display.mode = "showcase")

runExample(example = "09_upload", display.mode = "showcase")

