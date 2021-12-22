install.packages("tidyverse") # installing tidyverse
library(tidyverse) # setting up library 
library(dplyr)
library(readr)
data <- read.csv("/Users/adipillai/Desktop/bios-611-project/source_data/covid19_data.csv") # reading in data 
mydata <- as_tibble(data) # converting to tidyverse df format 
mydata # taking a look at it 

mydata %>% 
  rename(
    states_uts = State.UTs,
    total_cases = Total.Cases,
    active_ratio = Active.Ratio,
    discharge_ratio = Discharge.Ratio,
    death_ratio = Death.Ratio
  ) ## renaming column names 

## Some basic data analysis 

sort(table(data$Population), decreasing = TRUE)
