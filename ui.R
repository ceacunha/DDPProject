library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("Data Science FTW!"),
        sidebarPanel(
            numericInput(
                inputId = "id1", label = "Numeric Input",
                value = 0, min = 1, max = 10),
            checkboxGroupInput(
                inputId = "id2",label = "checkbox",
                choices = c("Value 1" = "1", "Value 2" = "2")
            ),
            dateInput(
                inputId = "id3", label = "Date"
            )
        ),
        mainPanel(
            h4("Numeric Input"),
            verbatimTextOutput("outId1"),
            h4("checked"),
            verbatimTextOutput("outId2"),
            h4("Ðate"),
            verbatimTextOutput("outId3")
        )
    )
)