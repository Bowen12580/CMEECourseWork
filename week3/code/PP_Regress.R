# Load required packages
library(ggplot2)
library(dplyr)

# Read the data
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")

# Draw the plot using ggplot
plot <- ggplot(MyDF, aes(x = Prey.mass, y = Predator.mass, color = Type.of.feeding.interaction)) +
   geom_point(aes(color = Predator.lifestage), shape = "+", alpha = 1) +  # Use shape "+" for crosses
   geom_smooth(method = "lm", aes(color = Predator.lifestage), se = FALSE, fullrange = TRUE) +
   scale_y_log10(breaks = c(1e-6, 1e-2, 1e+2, 1e+6),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
   scale_x_log10(breaks = c(1e-07, 1e-03, 1e+01),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
   labs(x = "Prey Mass in grams",
        y = "Predator mass in grams") +
   theme_minimal() +
   theme(legend.position = "bottom",
        panel.border = element_rect(fill = NA, color = "black", linewidth = 1)) +
   guides(color = guide_legend(title = "Predator.lifestage", ncol = 6, keywidth = 1, keyheight = 1))

# Save the plot to a PDF file
pdf("../results/PP_Regress.pdf")
print(plot)
dev.off()

# Calculate regression results
results <- MyDF %>%
  group_by(Type.of.feeding.interaction) %>%
  summarize(
    slope = coef(lm(Predator.mass ~ Prey.mass))[2],
    intercept = coef(lm(Predator.mass ~ Prey.mass))[1],
    R_Square = (cor(Predator.mass, Prey.mass))^2,
    F_statistic = summary(lm(Predator.mass ~ Prey.mass))$fstatistic[1],
    p_value = summary(lm(Predator.mass ~ Prey.mass))$fstatistic[4]
  )

# Save regression results to a CSV file
write.csv(results, file = "../results/PP_Regress_Results.csv", row.names = FALSE)
