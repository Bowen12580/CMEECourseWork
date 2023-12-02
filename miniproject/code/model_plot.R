# Load necessary packages
library(minpack.lm)
library(ggplot2)

# Read the data
data_subset <- read.csv("../results/LogisticGrowthData_subset.csv")

# Define the Gompertz model
gompertz_model <- function(t, r_max, K, N_0, t_lag) {
  N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1))
}

# Define the Logistic model
logistic1 <- function(t, r, K, N0) {
  N0 * K * exp(r * t)/(K + N0 * (exp(r * t) - 1))
}

# Create empty lists to store Gompertz and Logistic model fitting results
fit_results_gompertz <- list()
fit_results_logistic <- list()

# Create empty lists to store linear, quadratic, and cubic model fitting results
fit_results_linear <- list()
fit_results_quadratic <- list()
fit_results_cubic <- list()

# Iterate over each unique ID
for (unique_id in unique(data_subset$ID)) {
  # Select data for the specific ID
  subset_data <- subset(data_subset, ID == unique_id)
  subset_data$log_PopBio <- log(subset_data$PopBio + 1)

  # Fit linear model using log(PopBio + 1)
  linear_model <- lm(log_PopBio ~ Time, data = subset_data)
  fit_results_linear[[unique_id]] <- linear_model

  # Fit quadratic model
  quadratic_model <- lm(log_PopBio ~ poly(Time, 2), data = subset_data)
  fit_results_quadratic[[unique_id]] <- quadratic_model

  # Fit cubic model
  cubic_model <- lm(log_PopBio ~ poly(Time, 3), data = subset_data)
  fit_results_cubic[[unique_id]] <- cubic_model

  # Try fitting the Logistic model
  fit_logistic <- try(
    nlsLM(log_PopBio ~ logistic1(Time, r, K, N0), data = subset_data,
          start = list(r = 0.1, K = max(subset_data$log_PopBio), N0 = min(subset_data$log_PopBio)),
          control = nls.lm.control(maxiter = 10000)), silent = TRUE)
  if (class(fit_logistic) != "try-error") {
    fit_results_logistic[[unique_id]] <- fit_logistic
  }

  # Create a ggplot for visualization
  p <- ggplot(subset_data, aes(x = Time, y = log_PopBio)) +
    geom_point() +
    ggtitle(paste("Data and Model Fits for ID:", unique_id)) +
    xlab("Time") +
    ylab("Log(Abundance)")

  # Add linear model fit line (if successful)
  params_linear <- coef(linear_model)
  p <- p + geom_line(aes(x = Time, y = predict(linear_model, newdata = subset_data)), color = "yellow")

  # Add quadratic model fit line (if successful)
  p <- p + geom_line(aes(x = Time, y = predict(quadratic_model, newdata = subset_data)), color = "green")

  # Add cubic model fit line (if successful)
  p <- p + geom_line(aes(x = Time, y = predict(cubic_model, newdata = subset_data)), color = "orange")

  # Add Logistic model fit line (if successful)
  if (!is.null(fit_results_logistic[[unique_id]])) {
    params_logistic <- coef(fit_results_logistic[[unique_id]])
    p <- p + geom_line(aes(x = Time, y = predict(fit_results_logistic[[unique_id]], newdata = subset_data)), color = "blue")
  }

  # Save the plot to a file (path commented out)
  #save_path <- paste0("../results/plot_", unique_id, ".png")
  #ggsave(save_path, p, width = 8, height = 6) 

  # Print the plot
  print(p)
}
