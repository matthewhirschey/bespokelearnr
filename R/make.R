#' Make Tutorial Function
#'
#' This function allows you to make bespoke tutorials
#' @param list Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param output_file Path to place compiled file in 'tutorials/bespoketutorial' dir
#' @keywords tutorial
#' @export
#' @examples
#' make_tutorial(list = c(0, 7, 10))

make_tutorial <- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  all_files <- list.files()
  regex_string <- paste0("^", list, "_")

  textFiles <- character()

  for(i in 1:length(regex_string)){
    textFiles[i] <- all_files[stringr::str_detect(all_files, regex_string[i])]
  }
  print(textFiles)

  list_files <- list()
  for(i in 1:length(textFiles)){
    list_files[[i]] <- readLines(textFiles[i])
  }

  yaml_list <- yaml::yaml.load(readLines("yaml_header_tutorial.Rmd"))
  setup_chunk <- readLines("setup_chunk.Rmd")

  output <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    list_files
  )

  output <- unlist(output)
  output_file <- paste0(system.file("tutorials/bespoketutorial", package = "bespokelearnr"), "/bespoketutorial.Rmd")
  writeLines(output, con = output_file)
}

#' Make Lecture Function
#'
#' This function allows you to make bespoke lectures
#' @param list Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param output_file Path to place compiled file in 'tutorials/bespoketutorial' dir
#' @keywords lecture
#' @export
#' @examples
#' make_lecture(list = c(0, 7, 10))

make_lecture<- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  all_files <- list.files()
  regex_string <- paste0("^", list, "_")

  textFiles <- character()

  for(i in 1:length(regex_string)){
    textFiles[i] <- all_files[stringr::str_detect(all_files, regex_string[i])]
  }
  print(textFiles)

  list_files <- list()
  for(i in 1:length(textFiles)){
    list_files[[i]] <- readLines(textFiles[i])
  }

  yaml_list <- yaml::yaml.load(readLines("yaml_header_lecture.Rmd"))
  setup_chunk <- readLines("setup_chunk.Rmd")

  output <- c(
    "---",
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    "---",
    setup_chunk,
    list_files
  )

  output <- unlist(output)
  output_file <- paste0(system.file("tutorials/bespokelecture", package = "bespokelearnr"), "/bespokelecture.Rmd")
  writeLines(output, con = output_file)
}

