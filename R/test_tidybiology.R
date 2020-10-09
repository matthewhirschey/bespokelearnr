# #write scripts for getting tidybiology course
# source(paste0(getwd(), "/R/fun_prepare.R"))
# source(paste0(getwd(), "/R/fun_make.R"))
# source(paste0(getwd(), "/R/fun_launch.R"))
#
# #load libraries
# library(tidyverse)
# library(lubridate)
# library(proteins)
#
# data(proteins)
#
# #class 1
# prepare_data(bespoke_dataframe = proteins,
#              test = TRUE)
#
# prepare_metadata(bespoke_dataframe = proteins,
#                  dataframe_name = "proteins",
#                  dataframe_title = "proteins",
#                  dataframe_source = "Uniprot",
#                  dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
#                  dataframe_about = "This is the proteins dataset downloaded from Uniprot",
#                  dataframe_join_name = "proteins_join",
#                  dataframe_join_about = "This is a practice dataset for joining protiens",
#                  test = TRUE)
#
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew Hirschey & Akshay Bareja",
#              date = as.Date("2020-11-04"),
#              test = TRUE)
#
# make_lecture(lecture_num = c(10, 11, 20,21,22,23,30,90,91,92),
#              name = "class1",
#              test = TRUE)
#
# launch_lecture(name = "class1",
#                test = TRUE)
#
# #class 2
# prepare_data(bespoke_dataframe = proteins,
#              test = TRUE)
#
# prepare_metadata(bespoke_dataframe = proteins,
#                  dataframe_name = "proteins",
#                  dataframe_title = "proteins",
#                  dataframe_source = "Uniprot",
#                  dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
#                  dataframe_about = "This is the proteins dataset downloaded from Uniprot",
#                  dataframe_join_name = "proteins_join",
#                  dataframe_join_about = "This is a practice dataset for joining protiens",
#                  test = TRUE)
#
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew Hirschey & Akshay Bareja",
#              date = as.Date("2020-11-06"),
#              test = TRUE)
#
# make_lecture(lecture_num = c(31,32,33,34,35,36,37,38,39,90,91,92),
#              name = "class2",
#              test = TRUE)
#
# launch_lecture(name = "class2",
#               test = TRUE)
#
# #class 3
# prepare_data(bespoke_dataframe = proteins,
#              test = TRUE)
#
# prepare_metadata(bespoke_dataframe = proteins,
#                  dataframe_name = "proteins",
#                  dataframe_title = "proteins",
#                  dataframe_source = "Uniprot",
#                  dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
#                  dataframe_about = "This is the proteins dataset downloaded from Uniprot",
#                  dataframe_join_name = "proteins_join",
#                  dataframe_join_about = "This is a practice dataset for joining protiens",
#                  test = TRUE)
#
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew Hirschey & Akshay Bareja",
#              date = as.Date("2020-11-09"),
#              test = TRUE)
#
# make_lecture(lecture_num = c(40,41,42,44,45,46,47,90,91,92),
#              name = "class3",
#              test = TRUE)
#
# launch_lecture(name = "class3",
#                test = TRUE)
#
#
#
# #class 4
#
# prepare_data(bespoke_dataframe = proteins,
#              test = TRUE)
#
# prepare_metadata(bespoke_dataframe = proteins,
#                  dataframe_name = "proteins",
#                  dataframe_title = "proteins",
#                  dataframe_source = "Uniprot",
#                  dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
#                  dataframe_about = "This is the proteins dataset downloaded from Uniprot",
#                  dataframe_join_name = "proteins_join",
#                  dataframe_join_about = "This is a practice dataset for joining protiens",
#                  test = TRUE)
#
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew Hirschey & Akshay Bareja",
#              date = as.Date("2020-11-11"),
#              test = TRUE)
#
# make_lecture(lecture_num = c(50,51,52,60,70,90,91,92),
#              name = "class4",
#              test = TRUE)
#
# launch_lecture(name = "class4",
#                test = TRUE)
#
#
#
# #class 5
#
# prepare_data(bespoke_dataframe = proteins,
#              test = TRUE)
#
# prepare_metadata(bespoke_dataframe = proteins,
#                  dataframe_name = "proteins",
#                  dataframe_title = "proteins",
#                  dataframe_source = "Uniprot",
#                  dataframe_desc = "A dataset downloaded from Uniprot containing human proteome information",
#                  dataframe_about = "This is the proteins dataset downloaded from Uniprot",
#                  dataframe_join_name = "proteins_join",
#                  dataframe_join_about = "This is a practice dataset for joining protiens",
#                  test = TRUE)
#
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew Hirschey & Akshay Bareja",
#              date = as.Date("2020-11-13"),
#              test = TRUE)
#
# make_lecture(lecture_num = c(80,81,82,90,91,92),
#              name = "class5",
#              test = TRUE)
#
# launch_lecture(name = "class5",
#                test = TRUE)
#
#
#
#
# #test for mtcar
# prepare_data(test = TRUE)
# prepare_metadata(test = TRUE)
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew & Lucy",
#              date = today(),
#              test = TRUE)
#
#
