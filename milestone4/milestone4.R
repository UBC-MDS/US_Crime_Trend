library(shiny)
library(tidyverse)
library(ggplot2)
# read in data
us_crime <- read.csv("ucr_crime_1975_2015.csv")



ui <- fluidPage(
  titlePanel("US Crime Trends"),
  
  sidebarLayout(
    
    sidebarPanel(
      h4("Interactive Visualization of US Crime Rate"), 
      "This app allows you to visualize the different crime trends across different cities",
      hr(),
      sliderInput("Year",
                  label = "Range",
                  min = 1975,
                  max = 2015,
                  value = c(1975,2015),
                  sep=""),
      # user can select crime 
      radioButtons('Crime', "Type of Crime", 
                   
                   choices = list('Violent Crimes' = "violent_per_100k", 
                                  'Homicide Crimes' =  "homs_per_100k",
                                  'Rape Crimes' = 'rape_per_100k',
                                  'Robbery Crimes' = 'rob_per_100k',
                                  'Aggravated Assault' = 'agg_ass_per_100k'),
                   
                   selected = "homs_per_100k"),
      # user can select up to 3 cities
      selectInput("City",
                  label = "Select Cities (Max=3)",
                  choices = unique(us_crime$department_name),
                  selected = c("Atlanta","Seattle","Chicago"),
                  multiple = TRUE)
    ),
    
    
    mainPanel(
      plotOutput("trend")
    )
  )
)


server <- function(input, output) {
  
  observe(print(input$City))
  
  # filter data
  data_filtered <- reactive({
    us_crime%>% 
      filter(department_name %in% input$City) %>% 
      filter(year>=min(input$Year))%>% 
      filter(year<= max(input$Year)) %>% 
      select(year,input$Crime,department_name)
    
  })
  
  # plot time-series 
  output$trend <- renderPlot({
    data=data_filtered()
    data %>% 
      ggplot(aes(x = year,y = data[,2],group=department_name))+
      geom_line(aes(color=department_name,group=department_name))+
      geom_point()+
      ylab("Number of occurence / 100k citizens")+
      theme_light()+
      ggtitle('Crime trend Comparison')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)