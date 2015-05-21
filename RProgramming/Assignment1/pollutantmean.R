pollutantmean <- function(directory, pollutant, id = 1:332){

################################################################################
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".
##
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
##
## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
################################################################################

    Nid <- length(id)

    pol_values <- vector()

    for(i in 1:Nid){

        filename <- paste(directory, "\\", sprintf("%03d", id[i]), ".csv",
        sep = "", collapse = "")
        data <- read.csv(filename)

        index <- 0
        for(j in 1:4){
            if (attributes(data)$names[j] == pollutant) index <- j
        }
        if (index == 0) stop(paste(pollutant, "column not found", sep = "",
        collapse = ""))

        select_values <- data[,index]
        bad <- is.na(select_values)
        select_values <- select_values[!bad]
        pol_values <- c(pol_values, select_values)
    }

    sum(pol_values) / length(pol_values)
}
