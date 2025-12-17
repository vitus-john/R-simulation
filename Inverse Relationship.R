library(ggplot2)
library(dplyr)
library(tidyr)

# --- Data ---
df1 <- data.frame(
  Country = c("Nigeria", "South Africa", "Kenya", "USA", "UK", "France"),
  Professor = c(366.66, 4789.5, 4000, 7600, 6800, 5700),
  Legislator = c(13500, 7000, 5800, 14500, 10800, 9900)
)

# --- Create DI sequence and sustainability ---
DI <- seq(0, 1, length.out = 200)
S <- exp(-3 * DI)
df3 <- data.frame(DI = DI, S = S)

# --- Plot ---
ggplot(df3, aes(x = DI, y = S)) +
  geom_line(size = 1.2) +
  labs(
    title = "Inverse Relationship Between Disparity and Sustainability",
    x = "Disparity Index (DI)",
    y = "Sustainability (S)"
  ) +
  theme_minimal(base_size = 14)
