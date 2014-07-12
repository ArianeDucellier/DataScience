best <- function(state, outcome) {

################################################################################
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death rate
################################################################################

    if (sum(outcome == c("heart attack", "heart failure", "pneumonia")) == 0){
        stop("invalide outcome")
    }

    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    name <- data[,2]
    local <- data[,7]
    if (outcome == "heart attack"){
        rate <- as.numeric(data[,11])
    }
    else if (outcome == "heart failure"){
        rate <- as.numeric(data[,17])
    }
    else {
        rate <- as.numeric(data[,23])
    }

    bad <- is.na(rate)
    name_good <- name[!bad]
    local_good <- local[!bad]
    rate_good <- rate[!bad]

    if (sum(local_good == state) == 0){
        stop("invalid state")
    }

    name_select <- name_good[local_good==state]
    rate_select <- rate_good[local_good==state]

    m <- min(rate_select)
    name_best <- name_select[rate_select==m]
    sort(name_best)[1]

}