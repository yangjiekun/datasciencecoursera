library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("MPG Prediction Tool"),
        sidebarPanel(
                numericInput('wt', 'Weight (lb/1000)', 3.2, min = 1.0, max = 6.0, 
                             step = 0.1),
                numericInput('qsec', '1/4 mile time (second)', 17.9, min = 14.0, 
                             max = 23.0, step = 0.1),
                checkboxGroupInput('am', 'Transmission type',  
                                   c('Automatic' = 0, 'Manual' = 1), 0),
                submitButton('Submit')
                ),
        mainPanel(
                p('We built an miles per gallon(MPG) prediction tool using the 
                  mtcars dataset. Based on the best regression model selected by
                  an stepwise algorithm, weight, 1/4 mile time (acceleration rate) 
                  and transmission type are the three most significant predictors
                  for MPG.'),
                p('Please input the three metrics of your car in the left panel 
                  before clicking submit. You will get an MPG prediction for 
                  your car.'),
                p('(The default values are for an automatic car with mean weight 
                  and 1/4 mile time in the mtcars dataset.)'),
                h4('Your car has an estimated MPG of'),
                verbatimTextOutput('prediction')
                )
        ))