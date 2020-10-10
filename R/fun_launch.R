#' launch_lecture function
#'
#' This function allows you to launch the bespoke lecture you previously made
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

launch_lecture <- function(name = "bespokelecture", test = FALSE){
  if(test == TRUE) {
    path <- paste0(getwd(),"/inst/output/", name, "/")
    rmarkdown::run(file = paste0(path, name, ".Rmd"), render_args=list(envir=.GlobalEnv))
  } else {
  learnr::run_tutorial(name, "bespokelearnr")
  }
}

#' launch_tutorial function
#'
#' This function allows you to launch the bespoke tutorial you previously made
#' @param test A logical for developing function in inst/tutorials dir vs. installing function in tutorials dir
#' @keywords tutorial
#' @export

launch_tutorial <- function(name = "bespoketutorial", test = FALSE){
  if(test == TRUE) {
    path <- paste0(getwd(),"/inst/tutorials/", name, "/")
    rmarkdown::run(file = paste0(path, name, ".Rmd"), render_args=list(envir=.GlobalEnv))
  } else {
    learnr::run_tutorial(name, "bespokelearnr")
  }
}
