# NOTE: The way you have the regex written, this function cannot detect numbers above 9

make_lecture <- function(list, output_file){
  setwd(system.file("tutorials", package = "bespokelearnr"))
  b <- noquote(paste0(list, collapse = "|"))
  textFiles <- list.files(pattern = paste0("^[", b, "]"))
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


