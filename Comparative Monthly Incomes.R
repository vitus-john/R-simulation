library(tidyverse)

# --- Data ---
df <- tibble(
  Country = c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France"),
  Professor = c(366.66, 4789.5, 4000, 7600, 6800, 5700),
  Legislator = c(13500, 7000, 5800, 14500, 10800, 9900)
)

# --- Compute Ratios ---
df <- df %>% mutate(Ratio = round(Legislator / Professor, 2))

# --- Convert to long format for grouped bars ---
df_long <- df %>%
  pivot_longer(cols = c("Professor", "Legislator"),
               names_to = "Group",
               values_to = "Income") %>%
  mutate(Group = factor(Group, levels = c("Professor", "Legislator")))

# --- Plot ---
ggplot(df_long, aes(x = Income, y = Country, fill = Group)) +
  
  # Horizontal bars
  geom_col(position = position_dodge(width = 0.8), width = 0.6) +
  
  # Values inside bars
  geom_text(
    aes(label = round(Income, 0)),
    position = position_dodge(width = 0.8),
    hjust = -0.05, size = 4
  ) +
  
  # Ratio labels for Legislators
  geom_text(
    data = df,
    inherit.aes = FALSE,
    aes(x = Legislator, y = Country, label = paste0("Ratio: ", Ratio)),
    hjust = -0.05, size = 4, fontface = "bold"
  ) +
  
  # Colors
  scale_fill_manual(values = c("Professor" = "blue", "Legislator" = "red")) +
  
  # Axis limits
  xlim(0, 17000) +
  
  # Labels and title
  labs(
    title = "Comparative Monthly Incomes of Professors and Legislators with Income Ratios (Li/Pi)",
    x = "Monthly Income (USD)",
    y = "",
    fill = ""
  ) +
  
  # Theme
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),
    legend.position = "bottom",
    axis.text.y = element_text(size = 12)
  )
