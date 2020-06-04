best <- function(state,outcome){
  outcome <- read.csv('outcome-of-care-measures.csv')
  statedata <- split(outcome,outcome$State)$state
  
}