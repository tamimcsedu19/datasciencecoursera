best <- function(state, outcome) {
    
    ## Read outcome data
    outcome_frame <- read.csv('outcome-of-care-measures.csv',colClasses = "character")
    col_number <- 0
    if(outcome ==as.character('heart attack'))
        col_number <- 11
    else if(outcome == 'heart failure')
        col_number <- 17
    else if(outcome == 'pneumonia')
        col_number <- 23
    else
        stop('invalid outcome')   
    ##Clean the data
    outcome_heart_attack<-outcome_frame[which(outcome_frame$State==state),c(2,7,col_number)]
    
    if(nrow(outcome_heart_attack) == 0)
        stop('invalid state')
    
    outcome_heart_attack[,3] = as.numeric(outcome_heart_attack[,3])
    outcome_heart_attack = outcome_heart_attack[complete.cases(outcome_heart_attack),]



    min_v <- min(outcome_heart_attack[,3])
    best_hospitals <- as.character(outcome_heart_attack[which(outcome_heart_attack[3]==min_v),1])
    sort(best_hospitals)
    return(best_hospitals[1])
   
}