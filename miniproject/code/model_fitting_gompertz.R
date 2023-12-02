# Load the minpack.lm package
library(minpack.lm)

data_subset <- read.csv("../results/LogisticGrowthData_subset.csv")

# ----------------------------------------
# Gompertz model fitting
# ----------------------------------------

# Define the Gompertz model
gompertz_model <- function(t, r_max, K, N_0, t_lag) {
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}

# Create an empty data frame to store the fitting results
fit_results_gompertz <- data.frame()

# Iterate over each unique ID
for (unique_id in unique(data_subset$ID)) {
  # Select data for a specific ID
  subset_data <- subset(data_subset, ID == unique_id)

  # Log-transform the PopBio variable
  subset_data$log_PopBio <- log(subset_data$PopBio + 1)

  # Use linear regression to find initial values
  linear_model <- lm(log_PopBio ~ Time, data = subset_data)
  r_max_start <- coef(linear_model)["Time"]
  t_lag_start <- subset_data$Time[which.max(diff(diff(subset_data$log_PopBio)))]

  # Find initial values for N0 and K
  N0_start <- min(subset_data$log_PopBio)
  K_start <- max(subset_data$log_PopBio)

  # Use non-linear least squares to fit the Gompertz model
  fit_gompertz <- try(nlsLM(log_PopBio ~ gompertz_model(t=Time, r_max, K, N0, t_lag), data = subset_data,
                            start = list(r_max = r_max_start, K = K_start, N0 = N0_start, t_lag = t_lag_start)),
                      silent = TRUE)

  # Extract and calculate model statistics
  if (class(fit_gompertz) != "try-error") {
    RSS_gompertz <- sum(residuals(fit_gompertz)^2)
    TSS_gompertz <- sum((subset_data$log_PopBio - mean(subset_data$log_PopBio))^2)
    R_squared_gompertz <- 1 - (RSS_gompertz / TSS_gompertz)

    model_info_gompertz <- data.frame(
      ID = unique_id,
      AIC_gompertz = AIC(fit_gompertz),
      BIC_gompertz = BIC(fit_gompertz),
      RSS_gompertz = RSS_gompertz,
      TSS_gompertz = TSS_gompertz,
      R_squared_gompertz = R_squared_gompertz
    )
  } else {
    model_info_gompertz <- data.frame(
      ID = unique_id,
      AIC_gompertz = NA,
      BIC_gompertz = NA,
      RSS_gompertz = NA,
      TSS_gompertz = NA,
      R_squared_gompertz = NA
    )
  }

  # Add the current model information to the results data frame
  fit_results_gompertz <- rbind(fit_results_gompertz, model_info_gompertz)
}

# Export the results to CSV
write.csv(fit_results_gompertz, file = "../results/model_fitting_results_gompertz.csv", row.names = FALSE)
