library(tidyverse) # setting up library 
data <- read.csv("/Users/adipillai/Desktop/bios-611-project/source_data/covid19_data.csv") # reading in data 

data %>% 
  rename(
    states_uts = State.UTs,
    total_cases = Total.Cases,
    active_ratio = Active.Ratio,
    discharge_ratio = Discharge.Ratio,
    death_ratio = Death.Ratio
  ) ## renaming column names 

## Some basic data analysis 

df1 <- data %>%
  arrange(desc(Population))

head(df1)

