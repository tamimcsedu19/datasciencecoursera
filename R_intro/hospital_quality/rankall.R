rankall <- function(outcome, num = "best") {
    source('~/datasciencecoursera/R_intro/hospital_quality/rankhospital.R')
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
    outcome_short<-outcome_frame[,c(2,7,col_number)]
    bystate_list = split(outcome_short,outcome_short$State)
    
    res<-sapply(bystate_list,rankhospital, outcome=outcome,num=num)
    
    res<-t(res)
    res<-as.data.frame(res)
    colnames(res) <- c('hospital','state')
    #res <- tapply(outcome_short,outcome_short$State,rankhospital,outcome,best)
    return(res)
    
    
}