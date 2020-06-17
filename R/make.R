#' @export

make_tutorial <- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  single <- list[list < 10]
  double <- list[list >= 10]

  a <- list.files()[str_detect(list.files(), "^\\d")] # re-ordering files
  a <- a[order(as.numeric(str_extract(a, "\\d+")))] # re-ordering files

  if(length(single) == 0){
    text_single <- NULL
  } else {
    text_single <- a[str_detect(a, pattern = paste0(single, collapse = "|"))[1:10]][1:length(single)]
  }

  text_double <- a[str_detect(a, pattern = paste0(double, collapse = "|"))][1:length(double)]

  textFiles <- c(text_single, text_double)
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

make_lecture<- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  single <- list[list < 10]
  double <- list[list >= 10]

  a <- list.files()[str_detect(list.files(), "^\\d")] # re-ordering files
  a <- a[order(as.numeric(str_extract(a, "\\d+")))] # re-ordering files

  if(length(single) == 0){
    text_single <- NULL
  } else {
    text_single <- a[str_detect(a, pattern = paste0(single, collapse = "|"))[1:10]][1:length(single)]
  }

  text_double <- a[str_detect(a, pattern = paste0(double, collapse = "|"))][1:length(double)]

  textFiles <- c(text_single, text_double)
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

