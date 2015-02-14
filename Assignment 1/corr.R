source("complete.R")
corr <- function(directory, threshold = 0) {

  allCorrelations <- numeric()
  
  for(idVal in 1:332){
    data <- complete(directory, idVal)
    if(data$nobs > threshold){

        if(idVal < 10){ idFile <- paste0("00",idVal)}
        else if(idVal < 100){idFile <- paste0("0",idVal)}
        else idFile <- idVal
    
        path <- paste0(directory,"/",idFile,".csv")
        table <- read.csv(path)
        table <- table[!is.na(table$sulfate) & !is.na(table$nitrate) , c('sulfate','nitrate')]
        currentCor <- (cor(table[,'sulfate'],table[,'nitrate']))
        currentCor <- round(currentCor, 5)
        allCorrelations <- c(allCorrelations, currentCor)
    }
  }
    allCorrelations
}