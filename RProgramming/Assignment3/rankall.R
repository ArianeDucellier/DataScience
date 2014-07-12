rankall <- function(outcome, num = "best") {

################################################################################
## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
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

    flocal <- as.factor(local_good)
    state_levels <- levels(flocal)
    hospital <- vector(length = length(state_levels))
    
    for (j in 1:length(state_levels)){

        state <- state_levels[j]
 
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
            hospital[j] = name_select[mark==1]
        } else if (num == "worst"){
            hospital[j] = name_select[mark==length(mark)]
        } else if (num < 1 | num > length(mark)){
            hospital[j] = NA
        } else {
            hospital[j] = name_select[mark==num]
        }
    }

    list_best <- data.frame(hospital,state_levels)
    names(list_best) = c("hospital","state")
    row.names(list_best) = state_levels
    list_best
}