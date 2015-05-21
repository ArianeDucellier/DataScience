rankhospital <- function(state, outcome, num = "best") {

################################################################################
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate
################################################################################

    if (sum(outcome == c("heart attack", "heart failure", "pneumonia")) == 0){
        stop("invalid outcome")
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

    mark <- rank(rate_select, ties.method = "min")
    m <- max(mark)
    for (i in 1:m){
        name_sub <- name_select[mark==i]
        alphabetic <- order(name_sub)
        name_select[mark==i] <- name_sub[alphabetic]
        mark[mark==i] <- c(i:(i+length(name_sub)-1))
    }

    if (num == "best"){
        hospital = name_select[mark==1]
    } else if (num == "worst"){
        hospital = name_select[mark==length(mark)]
    } else if (num < 1 | num > length(mark)){
        hospital = NA
    } else {
        hospital = name_select[mark==num]
    }

    hospital
}