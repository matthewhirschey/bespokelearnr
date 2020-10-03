set.seed(42)
library(tidyverse)
#load dataset for for class
#source('R/metadata.R')#loads dataset-specific variables

#make dataframes
#df_input <- dataframe_name
# *programatically prepare this doc, where dataframe_name and df_input are the name of the data set?
#   OR...load this after making defining var in rmd?

df_numeric <- df_input %>% select_if(~is.numeric(.) & length(unique(.)) > 10) %>% select(-contains('id'))
df_character <- df_input %>% select_if(~is.character(.)) %>% select(-contains('id'))
df_id <- df_input %>% select(contains('id')) #make sure a variable contains 'id'!!!
#df_joined_character <- df_input_join %>% select_if(~is.character(.)) %>% select(-contains('id'))
#need to change the join to join anything, not a char
df_joined <- joined
#do I use these?
df_numeric_select <- df_numeric[sample(1:ncol(df_numeric), 1)] # choose a random numeric column
df_numeric_filter <- df_numeric_select[sample(1:nrow(df_numeric), 1),] # choose a random number within that column
df_character_select <- df_character[sample(1:ncol(df_character), 1)] # choose a random character column
df_character_filter <- df_character_select[sample(1:nrow(df_character), 1),] # choose a random value within that column
#sample and set global variables
df_numerics <- sample(colnames(df_numeric), 2)
df_numeric1_name <- df_numerics[1]
df_numeric1_vec <- df_input %>% select(matches(df_numeric1_name)) %>% pull()
df_numeric2_name <- df_numerics[2]
df_numeric2_vec <- df_input %>% select(matches(df_numeric2_name)) %>% pull()
df_characters <- sample(colnames(df_character), 2)
df_char1_name <- df_characters[1]
df_char1_vec <- df_input %>% select(matches(df_char1_name)) %>% pull() #not used
df_char2_name <- df_characters[2]
df_char2_vec <- df_input %>% select(matches(df_char2_name)) %>% pull() #not used
df_id_name <- sample(colnames(df_id), 1)
df_id_vec <- df_input %>% select(matches(df_id_name)) #not used
# df_joined_strings <- sample(colnames(df_joined_character), 3) #fix this (should be 2)
# df_joined_string1_name <- df_joined_strings[1] #family_history
# df_joined_string2_name <- df_joined_strings[2] #medication_hx
# df_joined_string3_name <- df_joined_strings[3] #health_status

df_2_notid <- df_input2  %>% select_if(~is.character(.)) %>% select(-contains('id'))
df_2_col <- sample(colnames(df_2_notid),1)
