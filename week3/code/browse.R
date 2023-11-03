  Exponential <- function(N0 = 1, r = 1, generations = 10) {
    # Runs a simulation of exponential growth
    # Returns a vector of length generations
    
    N <- rep(NA, generations)    # Creates a vector of NA
    
    N[1] <- N0
    for (t in 2:generations) {
      N[t] <- N[t-1] * exp(r)
      browser()
    }
    return (N)
  }

  plot(Exponential(), type="l", main="Exponential growth")


  doit <- function(x) {
      temp_x <- sample(x, replace = TRUE)
      if(length(unique(temp_x)) > 30) {#only take mean if sample was sufficient
          print(paste("Mean of this sample was:", as.character(mean(temp_x))))
          } 
      else {
          stop("Couldn't calculate mean: too few unique values!")
          }
      }