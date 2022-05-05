library(corrplot)
library(tidyverse)

data1 <- read_csv("derived_data/joined_and_cleaned.csv");
data2 <- select(data1, -state);
M = cor(data2);

heat_map <- {corrplot(M, diag = FALSE, title = "HDI Covid Feature Correlation Matrix", mar=c(0,0,1,0));
  recordPlot() }# by default, method = 'circle';

if(!dir.exists('figures')) dir.create('figures');

ggsave(filename = "figures/correlation-map.pdf",plot = replayPlot(heat_map))



