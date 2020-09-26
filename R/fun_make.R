#' make_list function
#'
#' This internal function allows you to make a list of lectures for bespoke content generation
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir

make_list <- function(lecture_num, test_var = FALSE){
  #add output directory creation; add here because each content generation step will require a make_list fun(), so this will be universal
  if(test_var == TRUE) {
    path <- getwd()
    inst <- "/inst"
    content <- "/content"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    content <- "/content"}
  #get files
  all_files <- list.files(paste0(path, inst, content))
  regex_string <- paste0("^", lecture_num, "_")

  textFiles <- character()

  for(i in 1:length(regex_string)){
    textFiles[i] <- all_files[stringr::str_detect(all_files, regex_string[i])]
  }
  #print(textFiles)

  list_files <- list()
  textFiles<-textFiles[!is.na(textFiles)]
  #print(textFiles)

  if(length(textFiles!=0)){
    for(i in 1:length(textFiles)){
      filename<-paste0(path, inst, content, "/", textFiles[i])
      list_files[[i]] <- readLines(filename)
    }
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

make_lecture<- function(lecture_num, name = "bespokelecture", test = FALSE){
  if(test == TRUE) {
    path <- getwd()
    inst <- "/inst"
    content <- "/content"
    data <- "/extdata"
    output <- "/output"
    media <- "/media"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    content <- "/content"
    data <- "/extdata"
    output <- "/output"
    media <- "/media"}
  if (!dir.exists(paste0(path, inst, output))) {
    dir.create(paste0(path, inst, output))
  }
  source(paste0(path, inst, content, "/metadata.R")) #to get dataframe_name
  list_files <- make_list(lecture_num, test_var = test)
  yaml_head <- yaml::yaml.load(readLines(paste0(path, inst, content, "/yaml_header.Rmd")))
  yaml_lecture <- yaml::yaml.load(readLines(paste0(path, inst, content, "/yaml_lecture.Rmd")))
  yaml_list <- c(yaml_head, yaml_lecture)
  setup_chunk <- readLines(paste0(path, inst, content, "/setup_chunk.Rmd"))
  relative_path <- paste0(path, inst, data)

  lecture_c <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    "```{r load, include = FALSE}",
    paste0("path <- ", "'", relative_path, "'"),
    paste0(dataframe_name, " <- readRDS(paste0(path, '/bespoke_dataframe.Rds'))"),
    paste0("###"),
    paste0(dataframe_join_name, " <- readRDS(paste0(path, '/bespoke_dataframe_join.Rds'))"),
    paste0("joined <- ", dataframe_name, " %>% right_join(", dataframe_join_name, ", by = 'id')"),
    paste0("###"),
    paste0("df_input <- ", dataframe_name, " # this line is for bespoke.R to get proper var"),
    paste0("source('", paste0(path, inst, content), "/metadata.R', local = TRUE)"), #loads dataset-specific variables
    paste0("source('", paste0(path, inst, content), "/bespoke.R', local = TRUE)"), #loads custom objects
    "```",
    list_files
  )
  #make specific output directory
  if (!dir.exists(paste0(path, inst, output, "/", name))) {
    dir.create(paste0(path, inst, output, "/", name))
  }
  lecture_c <- unlist(lecture_c)
  output_file <- paste0(path, inst, output, "/", name, "/", name,".Rmd")
  writeLines(lecture_c, con = output_file)

  #copy over media
  if (!dir.exists(paste0(path, inst, output, "/", name, media))) {
    dir.create(paste0(path, inst, output, "/", name, media))
  }
  file.copy(from = paste0(path, inst, content, media), to = paste0(path, inst, output, "/", name), recursive=TRUE)
}

#' make_tutorial Function
#'
#' This function allows you to make bespoke tutorials
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

make_tutorial <- function(lecture_num, name = "bespoketutorial", test = FALSE){
  if(test == TRUE) {
    path <- getwd()
    inst <- "/inst"
    content <- "/content"
    data <- "/extdata"
    tutorials <- "/tutorials"
    media <- "/media"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    content <- "/content"
    data <- "/extdata"
    tutorials <- "/tutorials"
    media <- "/media"}
  if (!dir.exists(paste0(path, inst, tutorials))) {
    dir.create(paste0(path, inst, tutorials))
  }
  source(paste0(path, inst, content, "/metadata.R"))
  list_files <- make_list(lecture_num, test_var = test)
  yaml_head <- yaml::yaml.load(readLines(paste0(path, inst, content, "/yaml_header.Rmd")))
  yaml_tutorial <- yaml::yaml.load(readLines(paste0(path, inst, content, "/yaml_tutorial.Rmd")))
  yaml_list <- c(yaml_head, yaml_tutorial)
  setup_chunk <- readLines(paste0(path, inst, content, "/setup_chunk.Rmd"))
  relative_path <- paste0(path, inst, data) #dataframe_file_name comes from metadata

  tutorial_c <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    "```{r load, include = FALSE}",
    paste0("path <- ", "'", relative_path, "'"),
    paste0(dataframe_name, " <- readRDS(paste0(path, '/bespoke_dataframe.Rds'))"),
    paste0("###"),
    paste0(dataframe_join_name, " <- readRDS(paste0(path, '/bespoke_dataframe_join.Rds'))"),
    paste0("joined <- ", dataframe_name, " %>% right_join(", dataframe_join_name, ", by = 'id')"),
    paste0("###"),
    paste0("df_input <- ", dataframe_name, " # this line is for bespoke.R to get proper var"),
    paste0("source('", paste0(path, inst, content), "/metadata.R')"), #loads dataset-specific variables
    paste0("source('", paste0(path, inst, content), "/bespoke.R')"), #loads custom objects
    "```",
    list_files
  )

  tutorial_c <- unlist(tutorial_c)
  #make specific output directory
  if (!dir.exists(paste0(path, inst, tutorials, "/", name))) {
    dir.create(paste0(path, inst, tutorials, "/", name))
  }
  output_file <- paste0(path, inst, tutorials, "/", name, "/", name,".Rmd")
  writeLines(tutorial_c, con = output_file)

  #copy over media
  if (!dir.exists(paste0(path, inst, tutorials, "/", name, media))) {
    dir.create(paste0(path, inst, tutorials, "/", name, media))
  }
  file.copy(from = paste0(path, inst, content, media), to = paste0(path, inst, tutorials, "/", name), recursive=TRUE)

}

get_lectures<-function(test_var = T){
  if(test_var == T) {
    path <- getwd()
    inst <- "/inst"
    content <- "/content"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    content <- "/content"}
  all_files <- list.files(paste0(path, inst, content))
  all_files <- all_files[stringr::str_detect(all_files, "_")]
  all_files <- all_files[stringr::str_detect(all_files, ".Rmd")]
  all_files <- all_files[grepl("^[[:digit:]]+",all_files)]
  print(all_files)
  str(all_files)
}
