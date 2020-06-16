make_lecture <- function(list, output_file = "bespokelecture.Rmd"){
  setwd(here::here("tutorials", "bespokelecture"))
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
  writeLines(output, con = output_file)
}


