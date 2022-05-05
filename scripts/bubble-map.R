library(tidyverse)

data3 <- read_csv("derived_data/joined_and_cleaned.csv")
data4 <- select(data3, -hdi);

bubble_plot_first <- ggplot(data4, aes(x = population, y = total_cases, size = deaths, color=state)) + geom_point(alpha=0.5) + scale_size(range = c(.1, 24), name="Deaths")+ ggtitle("Scatterplot of Total Cases and Deaths by State")
bubble_plot <- bubble_plot_first + expand_limits(y=7100000);

ggsave("figures/bubble-plot.png",plot=bubble_plot)