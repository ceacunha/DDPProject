library(shiny)
shinyUI(
    fluidPage(
        headerPanel(
            HTML("<h2>Brazilian Populational Growth Study</h2>
                <br>
                <p>
                    This Shiny App was created in order to address the course
                    project defined by Developing Data Products course - a module
                    part of the Johns Hopkins University Data Science Specialization
                    on Coursera.org.
                </p>
                <p>
                    The idea behind of this app is to provide an interactive
                    exploratory tool to visualize population distribution
                    between years 2000 and 2030 (a forecast from 2016 forward)
                    among all Brazilian States and Federal District.
                </p>
                <p>
                    As can be seen, the user is powered by filters for
                    searching period (slide bars restrict the period in question),
                    an numerical input text to filter mininum population
                    (in millions) and a complete list of brazilian states.
                </p>
                <p>
                    Every filter interaction automatically alters the result
                    in the graph on the right side, which plots the growth in
                    population per year - States are differenciated by dots and
                    line colors.
                 </p>
                 ")
        ),
        sidebarLayout(
            fluid = TRUE,
            sidebarPanel(
                width = 5,
                h4("Search Period: ", class="centered", width="200px"),
                sliderInput("inMinYear", "From",min = 2000, max = 2030, value = 2010),
                sliderInput("inMaxYear", "To",min = 2000, max = 2030, value = 2015),
                numericInput(
                    inputId = "inMinStatePopulation", label = "Minimun State Population (in Milliions)",
                    value = 1, min = 0.1, max = 50, step = 0.5),
                checkboxGroupInput(
                    inputId = "inState",label = "States",inline = TRUE,
                    choices = 
                        c(
                    "Acre - AC" = "AC",
                    "Alagoas - AL" = "AL",
                    "Amapá - AP" = "AP",
                    "Amazonas - AM" = "AM",
                    "Bahia - BA" = "BA",
                    "Ceará - CE" = "CE",
                    "Distrito Federal - DF" = "DF",
                    "Espírito Santo - ES" = "ES",
                    "Goiás - GO" = "GO",
                    "Maranhão - MA" = "MA",
                    "Mato Grosso - MT" = "MT",
                    "Mato Grosso do Sul - MS" = "MS",
                    "Minas Gerais - MG" = "MG",
                    "Pará - PA" = "PA",
                    "Paraíba - PB" = "PB",
                    "Paraná - PR" = "PR",
                    "Pernambuco - PE" = "PE",
                    "Piauí - PI" = "PI",
                    "Rio de Janeiro - RJ" = "RJ",
                    "Rio Grande do Norte - RN" = "RN",
                    "Rio Grande do Sul - RS" = "RS",
                    "Rondônia - RO" = "RO",
                    "Roraima - RR" = "RR",
                    "Santa Catarina - SC" = "SC",
                    "São Paulo - SP" = "SP",
                    "Sergipe - SE" = "SE",
                    "Tocantins - TO" = "TO"),
                    selected = c("SP", "RJ", "DF", "PE", "RS")
                )
            ),
            mainPanel(
                width = 7,
                plotOutput(outputId = "plotOutput")
            )
        )
    )
)