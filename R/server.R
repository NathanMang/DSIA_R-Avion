library(shiny)

server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    gapminder %>%
      filter(year==input$years) %>%
      ggplot(aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) +
      geom_point()
    
  })
}