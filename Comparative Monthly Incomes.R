# ---------------------------------------
# Data
# ---------------------------------------
df <- data.frame(
  Country = factor(
    c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France"),
    levels = c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France")
  ),
  Professors = c(366.66, 4789.5, 4000, 7600, 6800, 5700),
  Legislators = c(13500, 7000, 5800, 14500, 10800, 9900)
)

df$Ratio <- round(df$Legislators / df$Professors, 2)

# ---------------------------------------
# Long format with fixed group order
# ---------------------------------------
df_long <- tidyr::pivot_longer(
  df,
  cols = c(Professors, Legislators),
  names_to = "Group",
  values_to = "Income"
)

df_long$Group <- factor(
  df_long$Group,
  levels = c("Professors", "Legislators")  # Professors go DOWN
)

# ---------------------------------------
# Plot
# ---------------------------------------
ggplot(df_long, aes(x = Income, y = Country, fill = Group)) +
  
  # Horizontal bars
  geom_col(
    position = position_dodge2(width = 1, preserve = "single"),
    width = 1
  ) +
  
  # Income labels on bars
  geom_text(
    aes(label = round(Income, 0)),
    position = position_dodge2(width = 0.80, preserve = "single"),
    hjust = -0.2,
    vjust= 0.55,
    size = 3.2
  ) +
  
  # Ratio labels — Legislators only
  geom_text(
    data = df,
    inherit.aes = FALSE,
    aes(
      x = Legislators,
      y = Country,
      label = paste0("Ratio: ", Ratio)
    ),
    hjust = -0.35,
    vjust = 1.2,   # pushes ratio upward to Legislator bar
    size = 2.8,
    fontface = "bold"
  ) +
  
  # Colors
  scale_fill_manual(
    values = c(
      "Professors" = "#6666FF",
      "Legislators" = "#FF6666"
    )
  ) +
  
  # Axis limits
  scale_x_continuous(
    limits = c(0, 17000),
    expand = expansion(mult = c(0, 0.06))
  ) +
  
  # Labels
  labs(
    title = "Comparative Monthly Incomes of Professors and Legislators with Income Ratios (Li/Pi)",
    x = "Monthly Income (USD)",
    y = NULL,
    fill = NULL
  ) +
  
  # Theme
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "bottom",
    panel.grid.major = element_line(color = "grey80"),
    panel.grid.minor = element_blank()
  )

