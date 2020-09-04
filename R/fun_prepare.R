#' prepare_data function
#'
#' This function allows you to prepare a data set for bespoke content generation
#' @param bespoke_dataframe name of an object in your global environment from which to create a bespoke dataset
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords prepare
#' @export

prepare_data <- function(bespoke_dataframe = NULL, test = FALSE){
  if(test == TRUE) {
    path <- getwd()
    inst <- "/inst"
    data <- "/extdata/"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    data <- "/extdata/"}

  if(is.null(bespoke_dataframe)){
    load(file = paste0(path, "/data", "/mtcars.Rda"))
    bespoke_dataframe <- mtcars
  }
  #import
  #code for import data here
  bespoke_dataframe <-
    bespoke_dataframe %>%
    janitor::clean_names() %>% ##clean names (janitor)
    tidyr::drop_na() ##-remove NA

  #code for tests here
  ##test that bespoke_dataframe is df & in global env.

  ##test for a column named id (alt test to see if bespoke fails)
  if ("id" %in% colnames(bespoke_dataframe) == FALSE) {
    bespoke_dataframe <-
      bespoke_dataframe %>%
      tibble::rowid_to_column(var = "id")
  }
  ##df MUST contain at least one character and one numeric variable

  ##test for NULL/NA (return warning if it has them?)

  #code for unjoin
  bespoke_dataframe_join <-
    bespoke_dataframe %>%
    dplyr::select("id", sample(tidyselect::everything(), 1))

  data_file <- paste0(path, inst, data, quote(bespoke_dataframe_join), ".Rds")
  saveRDS(bespoke_dataframe_join, file = data_file)

  #get column from join df
  bespoke_dataframe_join_id <-
    bespoke_dataframe_join %>%
    dplyr::select(-"id")

  #unselect join col from parent df
  bespoke_dataframe <-
    bespoke_dataframe %>%
    dplyr::select(-colnames(bespoke_dataframe_join_id))

  data_file <- paste0(path, inst, data, quote(bespoke_dataframe), ".Rds")
  saveRDS(bespoke_dataframe, file = data_file)

message("Data prepared. File saved in extdata directory. Now make some metadata.")
}



#' prepare_metadata Function
#'
#' This function allows you to prepare metadata for your bespoke dataset. If from_template = FALSE, then the function is expecting a bunch of variables to be assigned. If from_template = TRUE, then a 'dummy' template is made. This step is not necessary if using default mtcars dataset
#' @param bespoke_dataframe name of an object in your global environment from which you created a bespoke dataset
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @param dataframe_name Name of your dataframe
#' @param dataframe_title Title of your dataframe
#' @param dataframe_source Source of your dataframe
#' @param dataframe_desc Description of your dataframe
#' @param dataframe_about About your dataframe
#' @param dataframe_join_name Name of your dataframe for joining
#' @param dataframe_join_about About your dataframe for joining
#' @keywords metadata
#' @export

prepare_metadata <- function(bespoke_dataframe = NULL,
                             dataframe_name = "INSERT_NAME",
                             dataframe_title = "INSERT_TITLE",
                             dataframe_source = "INSERT_SOURCE",
                             dataframe_desc = "INSERT_DESC",
                             dataframe_about = "INSERT_ABOUT",
                             dataframe_join_name = "INSERT_JOIN_NAME",
                             dataframe_join_about = "INSERT_JOIN_ABOUT",
                             test = FALSE){
  if(test == TRUE) { #this would allow for saving the document; we might need to change to write out the output to R script
      path <- getwd()
      inst <- "/inst"
      content <- "/content"
    } else {
      path <- system.file(package = "bespokelearnr")
      inst <- ""
      content <- "/content"}
  metadata_template <- paste0("#set these variables (default is from mtcars dataset)",
                     "\n",
                     "\ndataframe_name <-", "'", 'mtcars', "'",
                     "\ndataframe_title <-", "'", 'Base R mtcars Dataset', "'",
                     "\ndataframe_source <-", "'", 'Motor Trend magazine', "'",
                     "\ndataframe_desc <-", "'", 'The data were extracted from the 1974 Motor Trend US magazine.', "'",
                     "\ndataframe_about <-", "'",  'The dataset contains fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).', "'",
                     "\n",
                     "\n#join",
                     "\ndataframe_join_name <-", "'",  'mtcars_join', "'",
                     "\ndataframe_join_about <-", "'",  'A dataframe to practice joining', "'"
  )
  if(is.null(bespoke_dataframe)){
    metadata_template <- unlist(metadata_template)
    metadata_file <- paste0(path, inst, content, "/metadata.R")
    writeLines(metadata_template, con = metadata_file)
    message("Metadata prepared for default mtcars dataset.")
    return()
  }
  metadata_bespoke <- paste0("#set these variables",
           "\n",
           "\ndataframe_name <-", "'", dataframe_name, "'",
           "\ndataframe_title <-", "'", dataframe_title, "'",
           "\ndataframe_source <-", "'", dataframe_source, "'",
           "\ndataframe_desc <-", "'", dataframe_desc, "'",
           "\ndataframe_about <-", "'",  dataframe_about, "'",
           "\n",
           "\n#join",
           "\ndataframe_join_name <-", "'",  dataframe_join_name, "'",
           "\ndataframe_join_about <-", "'",  dataframe_join_about, "'"
    )
  metadata_bespoke <- unlist(metadata_bespoke)
  metadata_file <- paste0(path, inst, content, "/metadata.R")
  writeLines(metadata_bespoke, con = metadata_file)
  message(paste0("Metadata prepared for the ", dataframe_title, " dataset."))
}

#' prepare_yaml function
#'
#' This function allows you to prepare the YAML header for bespoke content generation
#' @param bespoke_dataframe name of an object in your global environment from which to create a bespoke dataset
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords prepare
#' @export

prepare_yaml <- function(test = FALSE,
                         title = "INSERT_TITLE",
                         subtitle = "INSERT_SUBTITLE",
                         author = "INSERT_AUTH",
                         date = lubridate::today()){
  if(test == TRUE) {
    path <- getwd()
    inst <- "/inst"
    content <- "/content"
  } else {
    path <- system.file(package = "bespokelearnr")
    inst <- ""
    content <- "/content"}

  yaml_head <- c(
    "---",
    paste0("title: ", "'", title, "'"),
    paste0("subtitle: ", "'", subtitle, "'"),
    paste0("author: ", "'", author, "'"),
    paste0("date: ", "'", date, "'")
  )

  yaml_head <- unlist(yaml_head)
  yaml_head_file <- paste0(path, inst, content, "/yaml_header.Rmd")
  writeLines(yaml_head, con = yaml_head_file)
}


