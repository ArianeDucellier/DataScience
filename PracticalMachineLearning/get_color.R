get_color <- function(x, mini, maxi, N){

palette <- colorRampPalette(c("white", "orange", "red"), space="rgb")

index <- 1

for(i in 1:(N - 2)){

    if ((x > mini + (2 * i - 1) * (maxi - mini) / (2 * (N - 1))) && (x <= mini + (2 * i + 1) * (maxi - mini) / (2 * (N - 1)))){
         index <- i + 1
    }
    if (x > mini + (2 * N - 3) * (maxi - mini) / (2 * (N - 1))){
        index <- N
    }
}

return(palette(N)[index])

}
