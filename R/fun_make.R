#' make_list function
#'
#' This internal function allows you to make a list of lectures for bespoke content generation
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir

make_list <- function(lecture_num, test = FALSE){
  #add output directory creation; add here because each content generation step will require a make_list fun(), so this will be universal
  if(test == TRUE) {
    path <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/bespokeDS/bespokelearnr/"
    inst <- "/inst"
    tutorials <- "/tutorials"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    tutorials <- "/tutorials"}
  outDir <- "output"
  if (!file.exists(outDir)) {
    dir.create(outDir)
  }
  #get files
  all_files <- list.files(paste0(path, inst, tutorials))
  regex_string <- paste0("^", lecture_num, "_")

  textFiles <- character()

  for(i in 1:length(regex_string)){
    textFiles[i] <- all_files[stringr::str_detect(all_files, regex_string[i])]
  }
  print(textFiles)

  list_files <- list()
  for(i in 1:length(textFiles)){
    list_files[[i]] <- readLines(paste0(path, inst, tutorials, "/", textFiles[i]))
  }
return(list_files)
}

#' Make Lecture Function
#'
#' This function allows you to make bespoke lectures
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords lecture
#' @export

make_lecture<- function(lecture_num, test = FALSE){
  if(test == TRUE) {
    path <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/bespokeDS/bespokelearnr"
    inst <- "/inst"
    data <- "/extdata"
    tutorials <- "/tutorials"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    data <- "/extdata"
    tutorials <- "/tutorials"}
  outDir <- "/output"
  if (!dir.exists(paste0(path, outDir))) {
    dir.create(paste0(path, outDir))
  }
  source(paste0(path, inst, tutorials, "/metadata.R"))
  list_files <- make_list(lecture_num)
  yaml_head <- yaml::yaml.load(readLines(paste0(path, inst, tutorials, "/yaml_header.Rmd")))
  yaml_lecture <- yaml::yaml.load(readLines(paste0(path, inst, tutorials, "/yaml_lecture.Rmd")))
  yaml_list <- c(yaml_head, yaml_lecture)
  setup_chunk <- readLines(paste0(path, inst, tutorials, "/setup_chunk.Rmd"))
  relative_data_path <- paste0(path, inst, data) #dataframe_file_name comes from metadata

  output <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    "```{r load, include = FALSE}",
    paste0("path_to_data <- ", "'", relative_data_path, "'"),
    paste0("bespoke_data <- readRDS(paste0(path_to_data, '/", dataframe_file_name, ".Rds'))"),
    paste0("bespoke_data_join <- readRDS(paste0(path_to_data, '/", dataframe_join_file_name, ".Rds'))"),
    paste0("joined <- bespoke_data %>% right_join(bespoke_data_join, by = 'id')"),
    paste0("source('", paste0(path, inst, tutorials), "/metadata.R')"), #loads dataset-specific variables
    paste0("source('", paste0(path, inst, tutorials), "/bespoke.R')"), #loads custom objects
    "```",
    list_files
  )

  output <- unlist(output)
  output_file <- paste0(path, outDir, "/", "bespokelecture.Rmd")
  writeLines(output, con = output_file)
}

#' make_tutorial Function
#'
#' This function allows you to make bespoke tutorials
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

make_tutorial <- function(lecture_num, test = FALSE){
  if(test == TRUE) {
    path <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/bespokeDS/bespokelearnr"
    inst <- "/inst"
    data <- "/extdata"
    tutorials <- "/tutorials"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    data <- "/extdata"
    tutorials <- "/tutorials"}
  outDir <- "/output"
  if (!dir.exists(paste0(path, outDir))) {
    dir.create(paste0(path, outDir))
  }
  source(paste0(path, inst, tutorials, "/metadata.R"))
  list_files <- make_list(lecture_num)
  yaml_head <- yaml::yaml.load(readLines(paste0(path, inst, tutorials, "/yaml_header.Rmd")))
  yaml_tutorial <- yaml::yaml.load(readLines(paste0(path, inst, tutorials, "/yaml_tutorial.Rmd")))
  yaml_list <- c(yaml_head, yaml_tutorial)
  setup_chunk <- readLines(paste0(path, inst, tutorials, "/setup_chunk.Rmd"))
  relative_data_path <- paste0(path, inst, data) #dataframe_file_name comes from metadata

  output <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    "```{r load, include = FALSE}",
    paste0("path_to_data <- ", "'", relative_data_path, "'"),
    paste0("bespoke_data <- readRDS(paste0(path_to_data, '/", dataframe_file_name, ".Rds'))"),
    paste0("bespoke_data_join <- readRDS(paste0(path_to_data, '/", dataframe_join_file_name, ".Rds'))"),
    paste0("joined <- bespoke_data %>% right_join(bespoke_data_join, by = 'id')"),
    paste0("source('", paste0(path, inst, tutorials), "/metadata.R')"), #loads dataset-specific variables
    paste0("source('", paste0(path, inst, tutorials), "/bespoke.R')"), #loads custom objects
    "```",
    list_files
  )

  output <- unlist(output)
  output_file <- paste0(path, outDir, "/", "bespoketutorial.Rmd")
  writeLines(output, con = output_file)
}
