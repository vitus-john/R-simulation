# --- Data ---
df1 <- data.frame(
  Country = c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France"),
  Professor = c(366.66, 4789.5, 4000, 7600, 6800, 5700),
  Legislator = c(13500, 7000, 5800, 14500, 10800, 9900)
)

# Convert to long format
df1_long <- df1 %>%
  pivot_longer(cols = c("Professor", "Legislator"), 
               names_to = "Group", values_to = "Salary")

# --- Plot ---
ggplot(df1_long, aes(x = Country, y = Salary, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
  geom_text(aes(label = Salary),
            position = position_dodge(width = 0.8),
            vjust = -0.3, size = 3) +
  scale_fill_manual(values = c("Professor"="#7C52A5", "Legislator"="#E36AA5")) +
  labs(
    title = "Salary Comparison (Professors vs Legislators)",
    y = "Monthly Salary (USD)", x = ""
  ) +
  theme_minimal(base_size = 13)

