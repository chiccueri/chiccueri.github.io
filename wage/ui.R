shinyUI (pageWithSidebar (
  headerPanel(
    h3("Mid-Atlantic Wage Data"),
    h4("Wage and other data for a group of 3000 male workers in the Mid-Atlantic region")
    ),
  sidebarPanel(
    p("This Shiny application allows you to chose 
      the variable to plot in Mid-Atlantic Wage data set"),
    selectInput("var", label="Choose the variable for x axis",
                 choices=list("year"=1, "age"=2, "maritl"=4, "race"=5,
                              "education"=6, "job class"=8, "health"=9),
                 selected=2),
    selectInput("var2", label="Choose a second variable to spread the plot by color",
                choices=list("year"=1, "age"=2, "maritl"=4, "race"=5,
                             "education"=6, "job class"=8, "health"=9),
                selected=6),
    checkboxInput("cbmean", label = "Show wage mean (red line)", value=TRUE),
    checkboxInput("legend", label = "Show the legend", value=FALSE)
#    checkboxInput("cbmedian", label = "Show wage median (black line)", value=TRUE)
#   sliderInput('color', 'chose the color', value=1, min=0, max=2, step=0.1)
  ),
  mainPanel (
#    textOutput('wageMean'),
    plotOutput('wage')
#    plotOutput('age')
  )
))