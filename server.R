library(shiny)
library(ggplot2)
library(reshape2)

population <- read.csv("populational.data.csv",header = FALSE, sep = ";", stringsAsFactors = FALSE)
colnames(population) <-
    c("State",
      "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
      "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
      "2020","2021","2022","2023","2024","2025","2026","2027","2028","2029",
      "2030")
population <- melt(population, "State")
colnames(population) <- c("State", "Year", "Population")
population$Population <-
    round(x = population$Population/1000000, digits = 2)
population$Year <- as.numeric(as.character(population$Year))

shinyServer(
    function(input, output){
        
        output$plotOutput <- renderPlot({
            
            newPopulation <-
                subset(population,
                       Year >= input$inMinYear & Year <= input$inMaxYear)
            
            newPopulation <-
                subset(newPopulation, State %in% input$inState)
            
            newPopulation <-
                subset(newPopulation, Population >= input$inMinStatePopulation)
            
            ggplot(newPopulation, aes(x = Year, y = Population)) +
                geom_point(aes(colour = State)) + ylab("Population in Millions") +
                xlab("Year")
        })
        
    }
)