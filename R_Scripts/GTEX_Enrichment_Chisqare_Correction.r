library(dplyr)

#load in your data which will be two columns, first is type which is the motif, and second is position, which is the position number that a GTEx cis- eQTL overlapped with
data <- GTEx_Position_Overlap
#Change type for which motif being tested
filtered_data <- data %>% filter(Type == 'ATF4') 
result_table <- filtered_data %>%
  group_by(Position) %>%
  summarise(observed_counts = n())

num_unique_positions <- n_distinct(result_table$Position)
total_observed_counts <- sum(result_table$observed_counts)
result_table$expected_counts <- total_observed_counts / num_unique_positions

result_table$expected_counts <- round(result_table$expected_counts)

print(result_table)
num_positions <- length(result_table$Position)  # Determine the number of positions dynamically

# Step 1: Create 2x2 contingency tables for each position
contingency_tables <- lapply(1:num_positions, function(i) {
  matrix(c(result_table$observed_counts[i], sum(result_table$observed_counts[-i]),result_table$expected_counts[i], sum(result_table$expected_counts[-i])),
         nrow = 2, byrow = TRUE)
})

# Step 2: Perform chi-squared tests for each 2x2 table
chi_square_tests <- lapply(contingency_tables, function(table) {
  chisq.test(table)
})

# Step 3: Apply Bonferroni correction to p-values
adjusted_p_values <- p.adjust(sapply(chi_square_tests, function(test) {
  test$p.value
}), method = "bonferroni")

# Create a table with positions and adjusted p-values
result_table <- data.frame(Position = 1:num_positions, Adjusted_P_Value = adjusted_p_values)

# Print the result table
print(result_table)
