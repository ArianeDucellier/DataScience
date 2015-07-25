library(ggplot2)

data <- read.table("data.txt", dec=".")

computeR2 <- function(id1, id2, data){
    m1 <- as.numeric(as.character(data[, id1]))
    m2 <- as.numeric(as.character(data[, id2]))
    freqData <- as.data.frame(table(m1, m2, useNA="no"))
    names(freqData) <- c("m1", "m2", "freq")
    subFreqData <- subset(freqData, freq > 0)
    subFreqData$m1 <- as.numeric(as.character(subFreqData$m1))
    subFreqData$m2 <- as.numeric(as.character(subFreqData$m2))
    fit <- lm(m2 ~ m1, data = subFreqData, weights = freq)
    R2 <- summary(fit)$r.squared
    return(R2)
}

R2bootstrap <- function(id1, id2, data, n){
    R2 <- vector(length = n)
    m1 <- as.numeric(as.character(data[, id1]))
    m2 <- as.numeric(as.character(data[, id2]))
    freqData <- as.data.frame(table(m1, m2, useNA="no"))
    names(freqData) <- c("m1", "m2", "freq")
    subFreqData <- subset(freqData, freq > 0)
    subFreqData$m1 <- as.numeric(as.character(subFreqData$m1))
    subFreqData$m2 <- as.numeric(as.character(subFreqData$m2))
    for (i in 1:n){
        i_app <- sample.int(dim(subFreqData)[1], size = dim(subFreqData)[1], replace = TRUE)
        i_pre <- c(1:dim(subFreqData)[1])[!c(1:dim(subFreqData)[1]) %in% i_app]
        app <- data.frame(y = subFreqData[i_app, 2], x = subFreqData[i_app, 1], freq = subFreqData[i_app, 3])
        pre <- data.frame(y = subFreqData[i_pre, 2], x = subFreqData[i_pre, 1], freq = subFreqData[i_pre, 3])
        fit <- lm(y ~ x, data = app, weights = freq)
        yhat <- predict(fit, pre)
        R2[i] <- 1 - sum((pre$y - yhat)^2) / sum((pre$y - mean(pre$y))^2)
    }
    return(mean(R2))
}

drawPlot <- function(id1, id2, data){
    m1 <- as.numeric(as.character(data[, id1]))
    m2 <- as.numeric(as.character(data[, id2]))
    freqData <- as.data.frame(table(m1, m2, useNA="no"))
    names(freqData) <- c("m1", "m2", "freq")
    subFreqData <- subset(freqData, freq > 0)
    subFreqData$m1 <- as.numeric(as.character(subFreqData$m1))
    subFreqData$m2 <- as.numeric(as.character(subFreqData$m2))
    fit <- lm(m2 ~ m1, data = subFreqData, weights = freq)
    coeff <- summary(fit)$coefficients
    g <- ggplot(subFreqData, aes(x = m1, y = m2))
    g <- g + scale_size(range = c(2, 20), guide = "none" )
    g <- g + geom_point(aes(colour = freq, size = freq))
    g <- g + scale_colour_gradient(low = "grey25", high = "white")                    
    g <- g + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 1, colour = "red")
    g <- g + geom_abline(intercept = 0, slope = 1, size = 1, linetype = "dashed", colour = "grey25")
    g <- g + coord_cartesian(xlim = c(min(subFreqData$m1), max(subFreqData$m1)),
                             ylim = c(min(subFreqData$m2), max(subFreqData$m2)))
    g <- g + labs(title = "Comparison between two scales", x = "Scale magnitude 1", y = "Scale magnitude 2")
    g
}

shinyServer(
    function(input, output) {
        colInput1 <- reactive({
            switch(input$id1,
                "md_L1" = 1,
                "md_L2" = 2,
                "md_L3" = 3,
                "mw" = 4,
                "mb" = 5,
                "ms" = 6,
                "ml" = 7)
        })
        colInput2 <- reactive({
            switch(input$id2,
                "md_L1" = 1,
                "md_L2" = 2,
                "md_L3" = 3,
                "mw" = 4,
                "mb" = 5,
                "ms" = 6,
                "ml" = 7)
        })
        output$text1 <- renderPrint({
            col1 <- colInput1()
            col2 <- colInput2()
            computeR2(col1, col2, data)})
        output$text2 <- renderPrint({
            col1 <- colInput1()
            col2 <- colInput2()
            R2bootstrap(col1, col2, data, 50)})
        output$myPlot <- renderPlot({
          col1 <- colInput1()
          col2 <- colInput2()
          drawPlot(col1, col2, data)})
    }
)
