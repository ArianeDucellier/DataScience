corr <- function(directory, threshold = 0){

################################################################################
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
##
## Return a numeric vector of correlations
################################################################################

    corr <- vector()

    for(i in 1:332){
    
        filename <- paste(directory, "\\", sprintf("%03d", i), ".csv",
        sep = "", collapse = "")
        data <- read.csv(filename)
    
        sulfate <- data[,2]
        nitrate <- data[,3]
        bad_sulfate <- is.na(sulfate)
        bad_nitrate <- is.na(nitrate)
        good_sulfate <- sulfate[(!bad_sulfate)&(!bad_nitrate)]
        good_nitrate <- nitrate[(!bad_sulfate)&(!bad_nitrate)]

        if (length(good_sulfate) > threshold){
            corr <- c(corr, cor(good_sulfate, good_nitrate))
        }
    }
    
    corr
}
