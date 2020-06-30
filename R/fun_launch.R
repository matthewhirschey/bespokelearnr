#' launch_lecture function
#'
#' This function allows you to launch the bespoke lecture you previously made
#' @keywords tutorial
#' @examples
#' launch_lecture()
#' @export

launch_lecture <- function(){
  learnr::run_tutorial("bespokelecture", "bespokelearnr")
}
