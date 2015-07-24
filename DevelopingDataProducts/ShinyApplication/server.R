library(ggplot2)

shinyServer(
    function(input, output) {
        computeR2 <- function(id1, id2){
            data <- read.table("data.txt")
            x <- data[, id1]
            y <- data[, id2]
            freqData <- as.data.frame(table(x, y))
            subFreqData <- subset(freqData, Freq > 0)
            fit <- lm(y ~ x, data = subFreqData, weights = Freq)
            R2 <- summary(fit)$r.squared
        }
        output$text <- renderText({computeR2(input$id1, input$id2)})
        output$myPlot <- renderPlot({
            plot(c(1:10), c(1:10))
#            g <- ggplot(subFreqData, aes(x = x, y = y))
#            g <- g + scale_size(range = c(2, 20), guide = "none" )
#            g <- g + geom_point(aes(colour = Freq, size = Freq))
#            g <- g + scale_colour_gradient(low = "grey25", high = "white")                    
#            g <- g + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 1, colour = "red")
#            g <- g + geom_abline(intercept = 0, slope = 1, size = 1, linetype = "dashed", colour = "grey25")
#            g <- g + coord_cartesian(xlim = c(min(subFreqData$x), max(subFreqData$x)),
#                                     ylim = c(min(subFreqData$y), max(subFreqData$y)))
#            g <- g + labs(title = "Comparison", x = "Scale magnitude 1", y = "Scale magnitude 2")
#            g
        })    
    }
)
