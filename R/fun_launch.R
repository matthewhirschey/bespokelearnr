#' launch_lecture function
#'
#' This function allows you to launch the bespoke lecture you previously made
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

launch_lecture <- function(test = FALSE){
  if(test == TRUE) {
    path <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/bespokeDS/bespokelearnr/inst/output/"
    rmarkdown::run(file = paste0(path, "bespokelecture.Rmd"))
  } else {
  learnr::run_tutorial("bespokelecture", "bespokelearnr")
  }
}

#' launch_tutorial function
#'
#' This function allows you to launch the bespoke tutorial you previously made
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

launch_tutorial <- function(test = FALSE){
  if(test == TRUE) {
    path <- "/Users/matthewhirschey/Dropbox/DUKE/PROJECTS/bespokeDS/bespokelearnr/inst/tutorials/"
    rmarkdown::run(file = paste0(path, "bespoketutorial.Rmd"))
  } else {
    learnr::run_tutorial("bespoketutorial", "bespokelearnr")
  }
}