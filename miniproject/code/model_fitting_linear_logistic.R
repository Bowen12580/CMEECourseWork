# Load the minpack.lm package
library(minpack.lm)

# ----------------------------------------
# Linear, Quadratic, Cubic Polynomial Model Fitting
# ----------------------------------------

# Read the dataset
data_subset <- read.csv("../results/LogisticGrowthData_subset.csv")

# Create an empty data frame to store fitting results
fit_results_polynomial <- data.frame()

# Iterate over each unique ID
for (unique_id in unique(data_subset$ID)) {
  # Select data for the current ID
  subset_data <- subset(data_subset, ID == unique_id)

  # Log-transform PopBio and add 1
  subset_data$log_PopBio <- log(subset_data$PopBio + 1)

  # Fit linear model using log(PopBio + 1)
  linear_model <- lm(log_PopBio ~ Time, data = subset_data)

  # Fit quadratic model
  quadratic_model <- lm(log_PopBio ~ poly(Time, 2), data = subset_data)

  # Fit cubic model
  cubic_model <- lm(log_PopBio ~ poly(Time, 3), data = subset_data)

  # Calculate AIC, BIC, R_squared, etc., and construct a data frame
  model_info <- data.frame(
    ID = unique_id,
    AIC_linear = AIC(linear_model),
    BIC_linear = BIC(linear_model),
    R_squared_linear = summary(linear_model)$r.squared,
    AIC_quadratic = AIC(quadratic_model),
    BIC_quadratic = BIC(quadratic_model),
    R_squared_quadratic = summary(quadratic_model)$r.squared,
    AIC_cubic = AIC(cubic_model),
    BIC_cubic = BIC(cubic_model),
    R_squared_cubic = summary(cubic_model)$r.squared
  )

  # Add current model information to the results data frame
  fit_results_polynomial <- rbind(fit_results_polynomial, model_info)
}

# Export results to CSV
write.csv(fit_results_polynomial, file = "../results/model_fitting_results_polynomial.csv", row.names = FALSE)

# ----------------------------------------
# Logistic Model Fitting
# ----------------------------------------

# Define the Logistic model
logistic1 <- function(t, r, K, N0) {
  N0 * K * exp(r * t)/(K + N0 * (exp(r * t) - 1))
}

# Create an empty data frame to store fitting results
fit_results_logistic <- data.frame()

# Iterate over each unique ID
for (unique_id in unique(data_subset$ID)) {
  # Select data for the current ID
  subset_data <- subset(data_subset, ID == unique_id)

  # Log-transform PopBio and add 1
  subset_data$log_PopBio <- log(subset_data$PopBio + 1)

  # Use linear regression to find the initial value for r (maximum slope)
  linear_model <- lm(log_PopBio ~ Time, data = subset_data)
  r_max_start <- coef(linear_model)["Time"]

  # Use non-linear least squares for Logistic model fitting
  fit_logistic <- nlsLM(log_PopBio ~ logistic1(Time, r, K, N0), data = subset_data,
                        start = list(r = r_max_start, K = max(subset_data$log_PopBio), N0 = min(subset_data$log_PopBio)),
                        control = nls.lm.control(maxiter = 10000))

  # Extract relevant information from the fitting results
  model_info_logistic <- data.frame(
    ID = unique_id,
    AIC_logistic = AIC(fit_logistic),
    BIC_logistic = BIC(fit_logistic),
    RSS_logistic = sum(residuals(fit_logistic)^2),
    TSS_logistic = sum((subset_data$log_PopBio - mean(subset_data$log_PopBio))^2),
    R_squared_logistic = 1 - (sum(residuals(fit_logistic)^2) / sum((subset_data$log_PopBio - mean(subset_data$log_PopBio))^2))
  )

  # Add current model information to the results data frame
  fit_results_logistic <- rbind(fit_results_logistic, model_info_logistic)
}

# Export results to CSV
write.csv(fit_results_logistic, file = "../results/model_fitting_results_logistic.csv", row.names = FALSE)
