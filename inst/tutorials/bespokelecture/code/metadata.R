###healthcare dataset
library(here)
library(readr)
library(dplyr)
#set these variables
file_name <- 'cdc.rds'
dataframe_name <-'cdc'
dataframe_title <-'CDC Dataset'
dataframe_source <-'Provisional Death Counts for Coronavirus Disease (COVID-19): Weekly State-Specific Data Updates.'
dataframe_desc <-'This report provides a weekly summary of deaths with coronavirus disease 2019 (COVID-19) by select geographic and demographic variables. In this release, counts of deaths are provided by the race and Hispanic origin of the decedent.'
dataframe_about <- 'COVID19'
path_to_data <- 'tutorials/bespokelecture/data/cdc.rds'
data <- readRDS(path_to_data)
cdc<- data
#join
dataframe_join_file_name <-'cdc_unweighted.csv'
dataframe_join_name <- 'Ethnicity'
dataframe_join_about <- 'pseudo-patient histories'
data2 <- read_csv('tutorials/bespokelecture/data/cdc_unweighted.csv')
joined <- read_csv('tutorials/bespokelecture/data/cdc_unweighted.csv') %>%  right_join(cdc,by = 'Ethnicity')
#joined
dataframe_joined_name <- 'joined'
