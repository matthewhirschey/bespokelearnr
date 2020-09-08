# source(paste0(getwd(), "/R/fun_prepare.R"))
# source(paste0(getwd(), "/R/fun_make.R"))
# source(paste0(getwd(), "/R/fun_launch.R"))
#
# #test 1 make default
# library(tidyverse)
# library(lubridate)
# prepare_data(test = TRUE)
# prepare_metadata(test = TRUE)
# prepare_yaml(title = "Tidybiology",
#              subtitle = "Intro to Data Science using R",
#              author = "Matthew & Lucy",
#              date = today(),
#              test = TRUE)
# make_lecture(lecture_num = c(7,8),
#              test = TRUE)
#
# launch_lecture(test = TRUE)
#
# #test 2 make custom
# library(tidyverse)
# library(lubridate)
# library(proteins)
# data(proteins)
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
#              date = today(),
#              test = TRUE)
#
# make_lecture(lecture_num = c(1, 2, 3),
#              test = TRUE)
#
# launch_lecture(test = TRUE)
#
# #test 3 make custom w/name
# library(tidyverse)
# library(lubridate)
# library(proteins)
# data(proteins)
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
#              date = today(),
#              test = TRUE)
#
# make_lecture(lecture_num = c(1, 2, 3),
#              name = "lecture1",
#              test = TRUE)
#
# make_lecture(lecture_num = c(4, 5, 6),
#              name = "lecture2",
#              test = TRUE)
#
# launch_lecture(name = "lecture1",
#                test = TRUE)
#
# launch_lecture(name = "lecture2",
#                test = TRUE)
#
