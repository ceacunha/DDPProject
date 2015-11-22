library(shiny)
shinyServer(
    function(input, output){   
        output$outId1 <- renderPrint({input$id1})
        output$outId2 <- renderPrint({input$id2})
        output$outId3 <- renderPrint({input$id3})
    }
)