# The programming assignment does not recommend to use the already built rankhospital function to be used again for this part.
# This is just a sample of how it would look if we needed to use it

withRankHospital <- function(outcome,num="best"){
  data1 <- read.csv('outcome-of-care-measures.csv')
  statenames <- unique(data1$State)
  newdataframe <- data.frame(matrix(ncol=2))
  newdataframe <- newdataframe[FALSE,] #Emptying the dataframe
  
  for (i in statenames){
    hospitalName <- rankhospital(i,outcome,num)
    newdataframe <- rbind(newdataframe,c(hospitalName,i))
  }
  
  newdataframe
}