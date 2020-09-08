#write scripts for getting tidybiology course
source(paste0(getwd(), "/R/fun_prepare.R"))
source(paste0(getwd(), "/R/fun_make.R"))
source(paste0(getwd(), "/R/fun_launch.R"))

#load libraries
library(tidyverse)
library(lubridate)
library(proteins)

#class 1
data(proteins)
prepare_data(bespoke_dataframe = proteins,
             test = TRUE)

prepare_metadata(bespoke_dataframe = proteins,
                 dataframe_name = "proteins",
                 dataframe_title = "proteins",
                 dataframe_source = "Uniprot",
                 dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
                 dataframe_about = "This is the proteins dataset downloaded from Uniprot",
                 dataframe_join_name = "proteins_join",
                 dataframe_join_about = "This is a practice dataset for joining protiens",
                 test = TRUE)

prepare_yaml(title = "Tidybiology",
             subtitle = "Intro to Data Science using R",
             author = "Matthew Hirschey & Akshay Bareja",
             date = today(),
             test = TRUE)

make_lecture(lecture_num = c(10, 11, 20),
             name = "class1",
             test = TRUE)

# launch_lecture(name = "class1",
#                 test = TRUE)

#class 2
prepare_data(bespoke_dataframe = proteins,
             test = TRUE)

prepare_metadata(bespoke_dataframe = proteins,
                 dataframe_name = "proteins",
                 dataframe_title = "proteins",
                 dataframe_source = "Uniprot",
                 dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
                 dataframe_about = "This is the proteins dataset downloaded from Uniprot",
                 dataframe_join_name = "proteins_join",
                 dataframe_join_about = "This is a practice dataset for joining protiens",
                 test = TRUE)

prepare_yaml(title = "Tidybiology",
             subtitle = "Intro to Data Science using R",
             author = "Matthew Hirschey & Akshay Bareja",
             date = today(),
             test = TRUE)

make_lecture(lecture_num = c(10, 11, 20),
             name = "class2",
             test = TRUE)

# launch_lecture(name = "class2",
#                test = TRUE)

#class 3

#class 4

#class 5




