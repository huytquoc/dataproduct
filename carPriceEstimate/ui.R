library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Car Price Estimation"),
  h4("Basing on Linear Model fit on the cars dataset of the caret library, the Application estimates Car Price according to the selected input Parameters below."),
  
  sidebarLayout(
    sidebarPanel(
      #selectInput("dataset", "Choose a dataset:", 
      #            choices = c("Boston", "pressure", "cars")),
      
      numericInput("obs", "Number of sample observations to view:", 5),
      
      helpText("Note: The linear prediction model is fitted on the Price outcome values and the variables including",
               "Mileage, Cylinder, Doors, Leather, Convertible, Hatchback, and Sedan features."),
      
      h5("Enter the input parameters below to estimate the Price of the car:"),
          numericInput("Mileage", "Mileage:", value = "10000"),
      selectInput("Cylinder", "Cylinder:", choices = c(4,6,8)),#sort(c(unique(datacars()$Cylinder)))),
      selectInput("Doors", "Doors:", choices = c(2,4)),#sort(c(unique(datacars()$Doors)))),
      checkboxInput("Leather", "Leather (Y/N)"),
      checkboxInput("Convertible", "Convertible (Y/N)"),
      checkboxInput("Hatchback", "Hatchback (Y/N)"),
      checkboxInput("Sedan", "Sedan (Y/N)"),
      
      submitButton("Update View")
    ),
    
    # The linear prediction model is fitted on the Price outcome values and the variables including
    # Mileage, Cylinder, Doors, Leather, Convertible, Hatchback, and Sedan features.
    mainPanel(
      #h4("cars dataset Summary"),
      #verbatimTextOutput("summary"),
      
      h4("Data/Observations Sample"),
      tableOutput("view"),
      
      h4("Linear Model Fit Summary"),
      tableOutput("modelfit"),
      
      h4(code("The prediction result from the input parameters")),
      textOutput("f"),
      
      hr(),
      helpText(em("Note: The model fit and estimation performed in the Application is just for the purpose 
               to show how reactive functions work in Shiny. The model fit, the accuracy is NOT in scope of this Application."))
    )
  )
))