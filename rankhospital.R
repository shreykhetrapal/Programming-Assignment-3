rankhospital <- function(state,outcome,num="best"){
  data1 <- read.csv('outcome-of-care-measures.csv')
  
  # Supress warnings
  options(warn = -1)
  
  # --------- Checking for valid input in outcome -------
  
  check <- c("heart attack", "heart failure")
  if (is.null(outcome)) {
    message("invalid outcome")
  }
  if (!outcome %in% check) stop("invalid outcome")
  
  # --------- Checking for valid input of state -----------
  stateNames <- unique(data1$State)
  if (is.null(state)) {
    message("invalid state")
  }
  if (!state %in% stateNames) stop("invalid state")

  # ------ Spitting dataframe according to state -------
  
  statedata <- split(data1,data1$State)[[state]]
  
  
  # ----- Order the dataframe according to name -----
  
  statedata <- statedata[order(statedata$Hospital.Name),]
  
  # --------- Setting outcome to column names --------
  
  if(outcome=="heart attack") outcome = statedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  if(outcome=="heart failure") outcome = statedata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure

  # ------ Rank the dataframe and give output ------
  
  if(num=="best") {
    return(sortedResult <- statedata$Hospital.Name[rank(as.numeric(outcome),ties.method ="first")==1])
  }
  if(num=="worst") {
    num = as.numeric(max(rank(as.numeric(outcome),ties.method = "first")))
    return(sortedResult <- statedata$Hospital.Name[rank(as.numeric(outcome),ties.method ="first")==num])
  }
  
  if(is.numeric(num) && num<max(rank(as.numeric(outcome),ties.method = "first"))) {
    return(sortedResult <- statedata$Hospital.Name[rank(as.numeric(outcome),ties.method ="first")==num])
  }
  
  # ----- Checking for valid num ------
  
  check <- c("best", "worst")
  
  if(num>as.numeric(max(rank(as.numeric(outcome),ties.method = "first")))) return(NA)
  
  if (!outcome %in% check) stop("invalid outcome")
}