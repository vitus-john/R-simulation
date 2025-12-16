library(ggplot2)
library(tidyr)

df <- data.frame(
  Country = factor(
    c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France"),
    levels = c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France")
  ),
  Professors = c(366.66, 4789.5, 4000, 7600, 6800, 5700),
  Legislators = c(13500, 7000, 5800, 14500, 10800, 9900)
)

df_long <- pivot_longer(
  df,
  cols = c(Professors, Legislators),
  names_to = "Group",
  values_to = "Salary"
)

# FORCE visual order (Professors first, Legislators second)
df_long$Group <- factor(
  df_long$Group,
  levels = c("Professors", "Legislators")
)

ggplot(df_long, aes(x = Country, y = Salary, fill = Group)) +
  geom_col(
    position = position_dodge(width = 0.8),
    width = 0.6
  ) +
  geom_text(
    aes(label = round(Salary, 0)),
    position = position_dodge(width = 0.8),
    vjust = -0.3,
    size = 3
  ) +
  scale_y_continuous(limits = c(0, NA)) +
  scale_fill_manual(
    values = c(
      "Professors" = "#6666FF",
      "Legislators" = "#FF6666"
    )
  ) +
  labs(
    title = "Salary Comparison (Professors vs Legislators)",
    y = "Monthly Salary (USD)",
    x = NULL,
    fill = NULL
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "bottom"
  )
