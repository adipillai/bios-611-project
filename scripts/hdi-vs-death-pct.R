library(tidyverse)

data <- read_csv("derived_data/joined_and_cleaned.csv") %>%
  mutate(pct_deaths=deaths/population);

the_plot <- ggplot(data, aes(pct_deaths, hdi)) + geom_point();

if(!dir.exists('figures')) dir.create('figures');

ggsave("figures/hdi-vs-death-pct.png",plot=the_plot)