species.name <- "Quercus robur" #You can alo use single quotes
species.name

mode(species.name)
paste('Quersuc','robur')
paste("Quercus", "robur", sep = " ")
paste("Quercus", "robur",sep = "") #Get rid of space

# Checks if a number is prime
is.prime <- function(n) {
  if (n==0) {
    return(paste(n,'is a zero!'))
  } else if (n==1) {
    return(paste(n,'is just a unit!'))
  }
    
  ints <- 2:(n-1)
  
  if (all(n%%ints!=0)) {
    return(paste(n,'is a prime!'))
  } else {
  return(paste(n,'is a composite!'))
    }
}

is.prime(3)