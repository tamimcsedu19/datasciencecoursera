complete <- function(directory, id = 1:332) {
  olddir <- getwd()
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  setwd(directory)
  #result_frame <- as.data.frame(setNames(replicate(2,numeric(0), simplify = F), c("id","nobs")))
  #print(result_frame)
  #colnames(result_frame) <- c("id", "nobs")
  n_obs <- c()
  for(i in id)
  {
    
    f_name <- sprintf("%03d.csv",i)
    frame <- read.csv(f_name)
    n_obs<-append(n_obs,sum(complete.cases(frame)))
  }
  result_frame <- data.frame(id= id,nobs=n_obs)
  setwd(olddir)
  return(result_frame)
}