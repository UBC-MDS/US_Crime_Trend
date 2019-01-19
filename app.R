
library(shiny)
library(tidyverse)
library(ggplot2)
us_crime <- read.csv("data/ucr_crime_1975_2015.csv", stringsAsFactors = FALSE)


ui <- fluidPage(
   titlePanel("US Crime Trends"),

   sidebarLayout(
      
      sidebarPanel(
         h4("Interactive Visualization of US Crime Rate"), 
         "We will be exploring the crime rates in different cities across the US in this project.",
         hr(),
         sliderInput("Year",
                     label = "From Year",
                     min = 1975,
                     max = 2015,
                     value = c(1975,2015),
                     sep=""),
        radioButtons('Crime', "please choose", 
                     
                     choices = c("violent_per_100k", "homs_per_100k"),
                     
                     selected = "homs_per_100k"),
         
         selectInput("City",
                     label = "city",
                     choices = unique(us_crime$department_name),
                     selected = "Atlanta")
      ),
          
                 
        mainPanel(
                   plotOutput("trend")
          )
      )
      )
   
     
server <- function(input, output) {
   
   observe(print(input$City))

   
   data_filtered <- reactive({
       us_crime%>% 
         filter(department_name==input$City) %>% 
         filter(year>=min(input$Year))%>% 
         filter(year<= max(input$Year)) %>% 
         select(year,input$Crime)
          
   })
   
   output$trend <- renderPlot({
      thing=input$Crime
      data=data_filtered()
      data %>% 
      ggplot(aes(x = year, y = data[,2] ))+geom_line()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

