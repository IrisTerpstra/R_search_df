install.packages("readxl")

library(readxl)
library(dplyr)

df <- read_excel ("C:/Users/IrisTerpstra/Documents/NepDF.xlsx")


#Functie: zoek op 1 of twee waardes en geef een overzicht hoe vaak die waardes voorkomen in de data
search_values <- function(enter_item_code, enter_destination){
  
  if (missing(enter_item_code)) {
    enter_item_code <- df['item_code']
  }
  if (missing(enter_destination)) {
    enter_destination <- df['destination']
  }
  
  df_new <- df %>%
    select(item_code, destination, rule_type, rule_type_code) %>%
    filter(item_code == enter_item_code, destination == enter_destination) %>%
    group_by(destination, rule_type_code) %>%
    summarise(item_code_n = n())
  
  return(df_new)
}

search_values(, 'To the left')