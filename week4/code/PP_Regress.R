# Here are packages we need
library(ggplot2)
library(dplyr)

# Set working directory (setwd() will help me to save documents to the 'results' directory)
setwd("../results")

# read the csv
data <- read.csv("../data/EcolArchives-E089-51-D1.csv")

# draw the plot use ggplot (not qplot)
plot <- ggplot(data, aes(x = log(Prey.mass), y = log(Predator.mass), color = Type.of.feeding.interaction)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Predator-Prey Relationship by Feeding Interaction",
       x = "Log Prey Mass",
       y = "Log Predator Mass")

# Save plot to pdf file in the 'results' directory
pdf("PP_Regress.pdf")
# use print as the problem indicates
print(plot)
dev.off()

# Calculate regression results including slope, intercept, R, F_statistic, p value
results <- data %>%
  group_by(Type.of.feeding.interaction) %>%
  summarize(slope = coef(lm(log(Predator.mass) ~ log(Prey.mass)))[2],
            intercept = coef(lm(log(Predator.mass) ~ log(Prey.mass)))[1],
            # I think it is linear model so that I use the following calculation
            R_Square = (cor(log(Predator.mass), log(Prey.mass)))^2,
            F_statistic = summary(lm(log(Predator.mass) ~ log(Prey.mass)))$fstatistic[1],
            p_value = summary(lm(log(Predator.mass) ~ log(Prey.mass)))$fstatistic[4])

# Save regression results to csv file in the 'results' directory
write.csv(results, file = "PP_Regress_Results.csv", row.names = FALSE)
