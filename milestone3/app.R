library(shiny)
library(tidyverse)
library(ggplot2)
us_crime <- read.csv("ucr_crime_1975_2015.csv")


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
                   
                   choices = c("violent_per_100k", "homs_per_100k", 'rape_per_100k','rob_per_100k','agg_ass_per_100k'),
                   
                   selected = "homs_per_100k"),
      
      selectInput("City1",
                  label = "city1",
                  choices = unique(us_crime$department_name),
                  selected = "Atlanta"),
      selectInput("City2",
                  label = "city2",
                  choices = unique(us_crime$department_name),
                  selected = "Chicago")
    ),
    
    
    mainPanel(
      plotOutput("trend")
    )
  )
)


server <- function(input, output) {
  
  observe(print(input$City1))
  
  
  data_filtered <- reactive({
    us_crime%>% 
      filter(department_name==input$City1 | department_name==input$City2 ) %>% 
      filter(year>=min(input$Year))%>% 
      filter(year<= max(input$Year)) %>% 
      select(year,input$Crime,department_name)
    
  })
  
  output$trend <- renderPlot({
    data=data_filtered()
    data %>% 
      ggplot(aes(x = year,y = data[,2],group=department_name))+
      geom_line(aes(color=department_name,group=department_name))+
      geom_point()+
      ylab(input$Crime)+
      ggtitle('Crime trend Comparison')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)