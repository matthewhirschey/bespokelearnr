# go to `tutorials` folder and set is as the working directory
# Trying the fix the regex problem in `make_lecture.R`

make_lecture_v2 <- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  single <- list[list < 10]
  double <- list[list >= 10]

  text_single <- list.files(pattern = paste0(single, collapse = "|"))
  text_double <- list.files(pattern = paste0(double, collapse = "|"))

  textFiles <- c(text_single, text_double)
  print(textFiles)

  list_files <- list()
  for(i in 1:length(textFiles)){
    list_files[[i]] <- readLines(textFiles[i])
  }

  yaml_list <- yaml::yaml.load(readLines("yaml_header.Rmd"))
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


