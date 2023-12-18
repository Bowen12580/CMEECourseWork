# load the data
load("../data/KeyWestAnnualMeanTemperature.RData")

# calculate correlation coefficients
observed_corr <- cor(ats$Year, ats$Temp)

# set permutations
num_permutations <- 1000

# create a vector to save the random cor
random_corrs <- numeric(num_permutations)

# use permutation test
for (i in 1:num_permutations) {
  # use sample to make random arrangement
  shuffled_temps <- sample(ats$Temp)
  
  # store random correlation coefficient
  random_corrs[i] <- cor(ats$Year, shuffled_temps)
}

# compute p value
p_value <- sum(random_corrs > observed_corr) / num_permutations

# print p_value
print(paste("p value is:", p_value))

# explain in the png
png(filename= "../results/results.png", width = 800, height = 600)
par(mar = c(4, 4, 2, 2))
plot(ats$Year, ats$Temp, type = "l", xlab = "Year", ylab = "Temperature", main = "Key West Florida average temperature ")
abline(lm(ats$Temp ~ ats$Year), col = "red")

dev.off()



# Generate histogram of random correlation coefficients 
png(filename = "../results/cor.png", width = 800, height = 600)
# Create a histogram with a density plot
hist(random_corrs, probability = TRUE, breaks=50, xlim=range(c(random_corrs, observed_corr)), 
     main="Density and Histogram of Random Correlation Coefficients", 
     xlab="Correlation Coefficient", col="gray", border="black")
# Add a density plot
dens <- density(random_corrs)
lines(dens, col="blue", lwd=2)
# Add the observed correlation line
abline(v=observed_corr, col="darkred", lwd=2, lty=2)
# Add a legend
legend("topleft", legend=c("Random Correlation Density", "Observed Correlation"), 
       col=c("blue", "darkred"), lwd=2, lty=1:2)
dev.off()



