shinyUI(
    pageWithSidebar(
        headerPanel("Comparison of earthquake magnitude scales"),
        sidebarPanel(
          selectInput("id1", "First scale of magnitude",
                      c("Duration Laboratory 1" = 1,
                        "Duration Laboratory 2" = 2,
                        "Duration Laboratory 3" = 3,
                        "Moment" = 4,
                        "Body wave" = 5,
                        "Surface wave" = 6,
                        "Local" = 7)),
          selectInput("id2", "Second scale of magnitude",
                      c("Duration Laboratory 1" = 1,
                        "Duration Laboratory 2" = 2,
                        "Duration Laboratory 3" = 3,
                        "Moment" = 4,
                        "Body wave" = 5,
                        "Surface wave" = 6,
                        "Local" = 7)),
          selectInput("id3", "Formulae form the scientific litterature",
                      c("none" = 0,
                        "mw as function of md" = 1,
                        "mw as function of ms (1)" = 2,
                        "mw as function of ms (2)" = 3,
                        "mw as function of ms (3)" = 4,
                        "mw as function of mb (1)" = 5,
                        "mw as function of mb (2)" = 6,
                        "mw as function of mb (3)" = 7)),
          submitButton('Submit'),
          h4("Coefficient of determination of the regression"),
          textOutput("text")
        ),
        mainPanel(
            plotOutput('myPlot')
        )
    )
)
