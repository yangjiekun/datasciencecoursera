library(shiny)

mpg <- function(wt, qsec, am) {
        fit <- lm(mpg ~ wt + qsec + am, mtcars)
        predict(fit, data.frame(wt = wt, qsec = qsec, am = as.numeric(am)))
}

shinyServer(
        function(input, output) {
                output$prediction <- renderPrint({mpg(input$wt, input$qsec, 
                                                      input$am)})
        }
        )
