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

# explain in the pdf
pdf("../results/results.pdf", width = 6, height = 6)
par(mar = c(4, 4, 2, 2))
plot(ats$Year, ats$Temp, type = "l", xlab = "Year", ylab = "Temperature", main = "Key West Florida average temperature ")
abline(lm(ats$Temp ~ ats$Year), col = "red")

dev.off()

# I checked in the overleaf. Make sure put main.tex and results.pdf in the same project
\documentclass[a4paper]{article}
\usepackage{graphicx}
\usepackage{geometry}

\begin{document}

\vspace*{-2cm}


\begin{verbatim}
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

# explain in the pdf
pdf("../results/results.pdf", width = 7, height = 5)
par(mar = c(4, 4, 2, 2))
plot(ats$Year, ats$Temp, type = "l", xlab = "Year", ylab = "Temperature", main = "Key West, Florida average temperature")
abline(lm(ats$Temp ~ ats$Year), col = "red")
text(1900, 24, paste("Observed correlation coefficient:", round(observed_corr, 2)), cex = 0.7)
text(1900, 24.5, paste("Approximate p-value:", round(p_value, 4)), cex = 0.7)
dev.off()

\end{verbatim}

\begin{figure}[ht]
  \centering
  \includegraphics[scale=0.8]{results.pdf}
  \caption{Key West, Florida average temperature}
  \label{fig:temperature}
\end{figure}

\end{document}

