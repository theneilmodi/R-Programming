complete <- function(directory, id = 1:332) {

  totalComplete <- data.frame();
  
  for(idVal in id){

    if(idVal < 10){ idFile <- paste0("00",idVal)}
    else if(idVal < 100){idFile <- paste0("0",idVal)}
    else idFile <- idVal
    
    path <- paste0(directory,"/",idFile,".csv")
    data <- read.csv(path)
    cases <- complete.cases(data)
    numComplete <- length(cases[cases==TRUE])
    
    tempComplete <- data.frame(id = idVal, nobs = numComplete);
    
    totalComplete <- rbind(totalComplete, tempComplete)
  }
  totalComplete
}