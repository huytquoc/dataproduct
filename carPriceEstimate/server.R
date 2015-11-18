library(shiny)
#rary(datasets)
#library(MASS)
library(scales)
library(caret)

data(cars)
# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "Boston" = Boston,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  datacars <- reactive({
    cars
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    #dataset <- datasetInput()
    #showSummary(dataset)
    dataset <- subset(cars, select = c(Mileage,Cylinder,Doors,Leather,convertible,hatchback,sedan))
    showSummary(dataset)
    #c("Mileage","Cylinder","Doors","Leather","convertible","hatchback","sedan")
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    #head(datasetInput(), n = input$obs)
    cars <- datacars()
    dataset <- subset(cars, select = c(Price,Mileage,Cylinder,Doors,Leather,convertible,hatchback,sedan))
    head(dataset, n = input$obs)
  })
  
#   showSummary <- function(dataset){
#     if (input$dataset == "Boston") {
#       summary(lm(medv~., data = dataset))
#     } else if (input$dataset == "pressure") {
#       summary(lm(pressure~., data = dataset))
#     } else if (input$dataset == "cars") {
#       summary(lm(Price~., data = dataset))
#     }
#   }
  
  showSummary <- function(dataset){
    summary(dataset)
  }
  
  output$modelfit <- renderTable ({
    
    cars <- datacars()
    fit <- lm(Price~Mileage+Cylinder+Doors+Leather+convertible+hatchback+sedan, data=cars)
    summary(fit)
  })
  
  # Calculate the output value from X and Y parameters
  sumEquation <- function(){
    if (input$powercheck) {
      power2(as.numeric(input$x)) + as.numeric(input$y)
    } else as.numeric(input$x) + as.numeric(input$y)
  }
  
  estimatePrice <- function() {
    
    Mileage <- as.numeric(input$Mileage)
    Cylinder <- as.numeric(input$Cylinder)
    Doors <- as.numeric(input$Doors)
    Leather <- as.numeric(input$Leather)
    convertible <- as.numeric(input$Convertible)
    hatchback <- as.numeric(input$Hatchback)
    sedan <- as.numeric(input$Sedan)
    
    value <- data.frame(Mileage=Mileage, Cylinder=Cylinder, Doors=Doors, Leather=Leather, convertible=convertible, hatchback=hatchback, sedan=sedan)
    
    cars <- datacars()
    fit <- lm(Price~Mileage+Cylinder+Doors+Leather+convertible+hatchback+sedan, data=cars)
    price <- predict(fit, value, interval = "confidence")
    if (price[1] <0) {
      print("Invaluable car. Sorry! Cannot estimate.")
      } else {
        #paste("Estimated value:", dollar(price[1]), "USD")
        paste("Estimated Value range from", dollar(price[2]), "to", dollar(price[3]), "USD")
        
      }
  }
  
  output$f <- renderText({
     validate(
       need((input$Mileage != "") && !is.na(as.numeric(input$Mileage)), "Please enter valid Mileage")
     )
#     validate(
#       need(input$y != "", "Please enter valid Y")
#     )
    #sumEquation()
    estimatePrice()
  })
  
  # 2nd function called 
  power2 <- function(x){
    x^2
  }
  
  
  
})