library(shiny)
library(fpp3)
data("tourism")
ui <- fluidPage(
  selectInput(
    inputId = "selected_region",
    label = "Region:",
    choices = "Yorke Peninsula"
  ),
  plotOutput("t_plot"),
  selectInput(
    inputId = "selected_purpose",
    label = "Select Purpose:",
    choices = c("Business", "Holiday", "Other", "Visiting")
  )
)

server <- function(input, output, session) {
  output$t_plot <- renderPlot({
    plot_td <- tourism[
      tourism$Region == "selected_region"
    ]
    autoplot(plot_td)
    output$selected_purpose <-renderPrint({input$select})
  })
}

shinyApp(ui, server)