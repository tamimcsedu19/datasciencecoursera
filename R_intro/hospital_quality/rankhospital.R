rankhospital <- function(outcome_short, outcome, num = "best") {
    
    ## Read outcome data
#     outcome_frame <- read.csv('outcome-of-care-measures.csv',colClasses = "character")
#     col_number <- 0
#     if(outcome ==as.character('heart attack'))
#         col_number <- 11
#     else if(outcome == 'heart failure')
#         col_number <- 17
#     else if(outcome == 'pneumonia')
#         col_number <- 23
#     else
#         stop('invalid outcome')   
#     ##Clean the data
#     outcome_short<-outcome_frame[which(outcome_frame$State==state),c(2,7,col_number)]
    
    if(nrow(outcome_short) == 0)
        stop('invalid state')
    
    outcome_short[,3] <- as.numeric(outcome_short[,3])
    outcome_short <- outcome_short[complete.cases(outcome_short),]
    
    #data cleaned
    
    
    sorted_outcome <- outcome_short[order(outcome_short[,3],outcome_short[,1]),]
    
    index = 0
    if(num == 'best')
        index <- 1
    else if(num == 'worst')
        index <- nrow(sorted_outcome)
    else
        index <- num

    return(c(sorted_outcome[index,1],sorted_outcome[1,2]))
    
}