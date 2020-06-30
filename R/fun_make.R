#' make_list function
#'
#' This internal function allows you to make a list of lectures for bespoke content generation
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param path Path to find files to find bespoke Rmd files

make_list <- function(lecture_num, path = system.file("tutorials", package = "bespokelearnr")){
  all_files <- list.files(path)
  regex_string <- paste0("^", lecture_num, "_")

  textFiles <- character()

  for(i in 1:length(regex_string)){
    textFiles[i] <- all_files[stringr::str_detect(all_files, regex_string[i])]
  }
  print(textFiles)

  list_files <- list()
  for(i in 1:length(textFiles)){
    list_files[[i]] <- readLines(textFiles[i])
  }
return(list_files)
}

#' make_tutorial Function
#'
#' This function allows you to make bespoke tutorials
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param path Path to find files to build bespoke tutorial
#' @keywords tutorial
#' @export
#' @examples
#' make_tutorial(list = c(0, 7, 10))

make_tutorial <- function(lecture_num, path = system.file("tutorials", package = "bespokelearnr")){
  list_files <- make_list(lecture_num)
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
  output_file <- paste0(path, "/bespoketutorial", "/bespoketutorial.Rmd")
  writeLines(output, con = output_file)
}

#' Make Lecture Function
#'
#' This function allows you to make bespoke lectures
#' @param lecture_num Numeric vector of numbers corresponding to the essential lectures you want to use
#' @param path Path to find files to build bespoke lecture
#' @keywords lecture
#' @export
#' @examples
#' make_lecture(list = c(0, 7, 10))

make_lecture<- function(lecture_num, path = system.file("tutorials", package = "bespokelearnr")){
  list_files <- make_list(lecture_num)
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
  output_file <- paste0(path, "/bespokelecture", "/bespokelecture.Rmd")
  writeLines(output, con = output_file)
}

