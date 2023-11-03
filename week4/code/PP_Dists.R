# Here are two packages we need
library(ggplot2)
library(dplyr)

# read the csv documents   'comment': 'load' is always for RData documents and it can not do the 'data frame' work
data <- read.csv("../data/EcolArchives-E089-51-D1.csv")
# The following uses dplyr to calculate mean and median
# calculate log mean and median 
######################
#   !!!!!!!   (Q:Why log? I also tried without log(just mean and median) there are no difference.)
# Answer: I forget to delete the log in the graph. If we do not use log the graph will not show the details of the data.(too big)
########################
mean_log_predator_mass <- log(mean(data$Predator.mass))
median_log_predator_mass <- log(median(data$Predator.mass))
mean_log_prey_mass <- log(mean(data$Prey.mass))
median_log_prey_mass <- log(median(data$Prey.mass))
#This ratio I use prey/predator
mean_log_size_ratio <- log(mean(data$Prey.mass / data$Predator.mass))
median_log_size_ratio <- log(median(data$Prey.mass / data$Predator.mass))

# set the window to let us see the three graphs in the same window when we run the code
par(mfrow = c(1, 3))

# Predator.mass Histogram
hist(log(data$Predator.mass), main = "Predator Mass Distribution", xlab = "Log Predator Mass")

# Prey.mass Histogram
hist(log(data$Prey.mass), main = "Prey Mass Distribution", xlab = "Log Prey Mass")

# Size Ratio Histogram
hist(log(data$Prey.mass / data$Predator.mass), main = "Size Ratio Distribution", xlab = "Log Size Ratio")

# save as pdf
pdf("../results/Pred_Subplots.pdf")
# here just need one row one column
par(mfrow = c(1, 1))
hist(log(data$Predator.mass), main = "Predator Mass Distribution", xlab = "Log Predator Mass")
dev.off()

pdf("../results/Prey_Subplots.pdf")
par(mfrow = c(1, 1))
hist(log(data$Prey.mass), main = "Prey Mass Distribution", xlab = "Log Prey Mass")
dev.off()

pdf("../results/SizeRatio_Subplots.pdf")
par(mfrow = c(1, 1))
hist(log(data$Prey.mass / data$Predator.mass), main = "Size Ratio Distribution", xlab = "Log Size Ratio")
dev.off()

# create data frame of statistics data
# use 'unique()' to avoid duplicates
results <- data.frame(Feeding_Type = unique(data$Type.of.feed),
                      Mean_Predator_Mass = mean_log_predator_mass,
                      Median_Predator_Mass = median_log_predator_mass,
                      Mean_Prey_Mass = mean_log_prey_mass,
                      Median_Prey_Mass = median_log_prey_mass,
                      Mean_Size_Ratio = mean_log_size_ratio,
                      Median_Size_Ratio = median_log_size_ratio)

# save as csv document
write.csv(results, file = "../results/PP_Results.csv", row.names = FALSE)