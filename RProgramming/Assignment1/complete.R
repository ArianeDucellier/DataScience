complete <- function(directory, id = 1:332){

################################################################################
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
##
## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
################################################################################

    Nid <- length(id)

    nobs <- vector()

    for(i in 1:Nid){
    
        filename <- paste(directory, "\\", sprintf("%03d", id[i]), ".csv",
        sep = "", collapse = "")
        data <- read.csv(filename)
    
        sulfate <- data[,2]
        nitrate <- data[,3]
        bad_sulfate <- is.na(sulfate)
        bad_nitrate <- is.na(nitrate)

        good <- c(1:(dim(data)[1]))
        good <- good[(!bad_sulfate)&(!bad_nitrate)]
        nobs <- c(nobs, length(good))
    }
    
    data.frame(id = id, nobs = nobs)
}
