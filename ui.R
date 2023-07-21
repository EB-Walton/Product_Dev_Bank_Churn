library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("DATA824 Product Development Project, July 2023"),
  sidebarPanel(
    h3('Do bank services help decrease customer churn?'),
    sliderInput('svc1', 'How many bank services would the customer have?', 1, 
                 min = 1, max = 4, step = 1),
  ),
  mainPanel(
    h3('How long do these customers stay with the bank?'),
    plotOutput('tenureHist')
  )
))

