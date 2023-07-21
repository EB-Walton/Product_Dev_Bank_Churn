library(shiny)
library(tidyverse)
library(ggplot2)

bank <- read.csv("~/R Files/Bank Customer Churn Prediction.csv", header = T)
factor(bank$country)
shinyServer(function(input, output){
  
  output$tenureHist <- renderPlot({
      bank.dat <- bank %>%
        filter(products_number == input$svc1)
      
      mu <- mean(bank.dat$tenure)
      mse <- mean((bank.dat$tenure - mu)^2)
      
      ggplot(bank.dat, aes( x = tenure)) +
        geom_histogram(fill = 'purple',
                       center = 0, binwidth = 1) +
        geom_vline(xintercept = mu, lwd = 3) +
        xlab('Tenure of Customer') + 
        scale_x_binned(breaks = 1:10, 
                       nice.breaks = TRUE, 
                       limits = c(0,10)) +
        ggtitle(label = 'Number of Years Staying with the Bank',
                subtitle = paste(" mu =", round(mu, 2), "\n",
                         "MSE = ", round(mse, 2)))

  })
  }
)
