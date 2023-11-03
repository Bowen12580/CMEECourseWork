# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())

stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K) + rnorm(1, 0, sigma)) # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)

}
print("Stochastic Ricker takes:")
print(system.time(res1<-stochrick()))

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 
rm(list = ls())
stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100) {
  
  # initial matrix
  N <- matrix(NA, numyears, length(p0))
  
  # Store the initial number of individuals in the matrix rows for the first year
  N[1, ] <- p0
  
  # Modelling the stochastic Ricker equation using matrix operations to add fluctuations from a normal distribution
  for (yr in 2:numyears) {
    N[yr, ] <- N[yr-1, ] * exp(r * (1 - N[yr - 1, ] / K) + rnorm(length(p0), 0, sigma))
  }
  

  return(N)
}


print("Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrickvect()))

# print("Vectorized Stochastic Ricker takes:")
# print(system.time(res2<-stochrickvect()))