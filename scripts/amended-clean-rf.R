library(tidyverse)

c19_new <- read_csv("source_data/covid19_data.csv") %>%
  transmute(state=`State/UTs`,
            active=`Active`,
            total_cases=`Total Cases`,
            deaths=`Deaths`,
            discharged=`Discharged`,
            population=`Population`);

active_first <- select(c19_new,'active')
active <- active_first[-18,]
  
data5 <- read_csv("derived_data/joined_and_cleaned.csv") %>%
mutate(active);

write_csv(data5, "derived_data/amended_cleaned_rf.csv");
