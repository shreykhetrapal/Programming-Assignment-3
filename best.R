best <- function(state,outcome){
  
  # --------- Checking for valid input in outcome -------
  
  check <- c("heart attack", "heart failure", "pneumonia")
  if (is.null(outcome)) {
    message("invalid outcome")
  }
  if (!outcome %in% check) stop("invalid outcome")
  
  # --------- Checking for valid input of state -----------
  data1 <- read.csv('outcome-of-care-measures.csv')
  stateNames <- unique(data1$State)
  if (is.null(state)) {
    message("invalid state")
  }
  if (!state %in% stateNames) stop("invalid state")
  
  # ------ Spitting dataframe according to state -------
  
  statedata <- split(data1,data1$State)[[state]]
  
  # --------- Setting outcome to column names --------
  
  if(outcome=="heart attack") outcome = statedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  if(outcome=="heart failure") outcome = statedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  if(outcome=="pneumonia") outcome = statedata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  
  # --------- Subsetting required conditions ---------
  
  best_result <- statedata$Hospital.Name[which.min(as.numeric(outcome))]
  
  best_result
  
}