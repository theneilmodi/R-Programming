pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  totalData <- 0.0
  
  for(idVal in id){
    if(idVal < 10){ idVal <- paste0("00",idVal)}
    else if(idVal < 100){idVal <- paste0("0",idVal)}

    path <- paste0(directory,"/",idVal,".csv")
    data <- read.csv(path)
    data <- data[!is.na(data[pollutant]), pollutant]
    totalData <- c(totalData, data)
  }
  
  totalMean <- mean(totalData)
  format(round(totalMean, 3), nsmall = 3)
}

