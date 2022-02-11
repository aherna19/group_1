library(shiny)
library(fpp3)
data("tourism")
ui <- fluidPage(
  selectInput(
    inputId = "selected_region",
    label = "Region:",
    choices = c("Yorke Peninsula", "Adelaide", "Adelaide Hills", "Australia's Coral Coast", "Australia's Golden Outback"  )
  ),
  
  selectInput(
    inputId = "selected_purpose",
    label = "Select Purpose:",
    choices = c("Business", "Holiday", "Other", "Visiting")
  ),
  plotOutput("t_plot")
)

server <- function(input, output, session) {
  output$t_plot <- renderPlot({
    plot_td <- subset(tourism, Region == input$selected_region & Purpose == input$selected_purpose)
    autoplot(plot_td)
  })
}

shinyApp(ui, server)