library(tidyverse)

c19 <- read_csv("source_data/covid19_data.csv") %>%
  transmute(state=`State/UTs`,
    total_cases=`Total Cases`,
    deaths=`Deaths`,
    discharged=`Discharged`,
    population=`Population`);

state_fix_mapping <- list(`Andaman and Nicobar Islands`="Andaman and Nicobar",
                          `Chandigarth`="Chandigarh",
                          `Dadra and Nagar Haveli`="Dadra and Nagar Haveli and Daman and Diu",
                          `New Delhi`="Delhi",
                          `Orissa`="Odisha",
                          `Telangana`="Telengana",
                          `Uttaranchal`="Uttarakhand");

fix_state <- function(st){
  Map(function(s){
    new_val <- state_fix_mapping[[s]];
    if (is.null(new_val)) {
      s
    } else {
      new_val;
    }
  }, st) %>% unname() %>% unlist();
}

hdi <- read_csv("source_data/gdl_humandevelopment_data.csv") %>% 
  select(Region, `Sub-national HDI`) %>%
  transmute(state=fix_state(Region), hdi=`Sub-national HDI`);

all_data <- c19 %>% inner_join(hdi, by="state");

post_join_states <- all_data %>% pull(state);
c19_states <- c19 %>% pull(state);
hdi_states <- hdi %>% pull(state);

bad_c19 <- c19_states[!(c19_states %in% post_join_states)]
bad_hdi <- hdi_states[!(hdi_states %in% post_join_states)]

print(sprintf("These states were dropped from the c19 data set: %s", 
              paste(bad_c19,collapse=", ")))
print(sprintf("These states were dropped from the hdi data set: %s", 
              paste(bad_hdi, collapse=", ")))

if(!dir.exists("derived_data")){
  dir.create("derived_data");
}

write_csv(all_data, "derived_data/joined_and_cleaned.csv");


