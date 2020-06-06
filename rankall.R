rankall <- function (outcome , num="best"){
  # --------- Checking for valid input in outcome -------
  
  check <- c("heart attack", "heart failure", "pneumonia")
  if (is.null(outcome)) {
    message("invalid outcome")
  }
  if (!outcome %in% check) stop("invalid outcome")
  
  # ---- Constructing new dataframe and naming the columns ------
  
  data1 <- read.csv('outcome-of-care-measures.csv')
  newdataframe <- data.frame(matrix(nrow=1,ncol=2))
  colnames(newdataframe) <- c('hospital','state')
  
  
  # ---- Subsetting dataframe for needed columns only -----
  data2 <- read.csv('outcome-of-care-measures.csv')
  
  data1 <- subset(data2,select = c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  
    
}