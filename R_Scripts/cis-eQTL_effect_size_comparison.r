# Load the required library
library(BSDA)

# Read data from the csv file that has slope and se data for cis- eqtls to test
data <- read.csv("PATH/TO/DATA.csv", header = TRUE)

# Given sample sizes for the two groups
n_TM <- 110
n_control <- 110

# Initialize an empty data frame to store the results
results_df <- data.frame(i = numeric(0), lower_CI = numeric(0), upper_CI = numeric(0))

# Loop through the rows of the data frame
for (i in 1:nrow(data)) {
  # Extract mean (slope/effect size) and standard error for the current row
  mean_TM <- data$TM_bhat[i]
  se_TM <- data$TM_SE[i]
  mean_control <- data$control_bhat[i]
  se_control <- data$control_SE[i]
  
  # Convert standard error to standard deviation
  sd_TM <- se_TM * sqrt(n_TM)
  sd_control <- se_control * sqrt(n_control)
  
  # Perform Bayesian tsum test using bsda
  result <- tsum.test(mean.x = mean_TM, mean.y = mean_control, n.x = n_TM, n.y = n_control, s.x = sd_TM, s.y = sd_control, var.equal = FALSE, conf.level = 0.9)

  # Extract and store the confidence intervals in the results data frame
  results_df <- rbind(results_df, c(i, result$conf.int[1], result$conf.int[2]))
}

# Rename the columns of the results data frame
colnames(results_df) <- c("row", "lower_CI", "upper_CI")

for (i in 1:nrow(results_df)) {
  # Check if the CI crosses 0
  if (!is.na(results_df$lower_CI[i]) && !is.na(results_df$upper_CI[i])) {
    if (results_df$lower_CI[i] < 0 && results_df$upper_CI[i] > 0) {
      results_df$Significance[i] <- "NSIG"
    } else {
      results_df$Significance[i] <- "SIG"
    }
  }
}
write.csv(results_df, "PATH/TO/Results_df.csv", row.names = FALSE)
