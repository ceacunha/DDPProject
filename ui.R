library(shiny)
shinyUI(
    fluidPage(
        headerPanel("Brazilian Population Growth Study"),
        sidebarLayout(
            fluid = TRUE,
            sidebarPanel(
                width = 5,
                tags$label("Search Period: ", class="centered", width="200px"),
                tags$label("From", width = "20px"),
                tags$input(id = "inMinYear", style = "width:70px",
                           value = 2010, min = 2000, max = 2030, type="number"),
                tags$label("To"),
                tags$input(id = "inMaxYear", style = "width:70px", value = 2015, min = 2000, max = 2030, type="number"),
                
                numericInput(
                    inputId = "inMinStatePopulation", label = "Minimun State Population (in Milliions)",
                    value = 1, min = 0.1, max = 200),
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