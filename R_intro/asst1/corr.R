corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    olddir <- getwd()
    
    setwd(directory)
    id <- 1:332
    res <- numeric(0)
    for(i in id)
    {
        
        f_name <- sprintf("%03d.csv",i)
        frame <- read.csv(f_name)
        
        n_obs<-complete.cases(frame)
        c_n_obs <- sum(n_obs)
        if(c_n_obs > threshold)
        {
           
           res <- append(res,cor(frame[n_obs,c("sulfate","nitrate")])["sulfate","nitrate"])
            
        }
    }
    
    
    
    
    
    setwd(olddir)
    return(res)
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
}