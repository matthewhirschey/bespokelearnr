change_yaml_matter <- function(input_file, ..., output_file) {
  input_lines <- readLines(input_file)
  delimiters <- grep("^---\\s*$", input_lines)
  if (!length(delimiters)) {
    stop("unable to find yaml delimiters")
  } else if (length(delimiters) == 1L) {
    if (delimiters[1] == 1L) {
      stop("cannot find second delimiter, first is on line 1")
    } else {
      # found just one set, assume it is *closing* the yaml matter;
      # fake a preceding line of delimiter
      delimiters <- c(0L, delimiters[1])
    }
  }
  delimiters <- delimiters[1:2]
  yaml_list <- yaml::yaml.load(input_lines[ (delimiters[1]+1):(delimiters[2]-1) ])

  dots <- list(...)
  yaml_list <- c(yaml_list[ setdiff(names(yaml_list), names(dots)) ], dots)

  output_lines <- c(
    if (delimiters[1] > 0) input_lines[1:(delimiters[1])],
    strsplit(yaml::as.yaml(yaml_list), "\n")[[1]],
    input_lines[ -(1:(delimiters[2]-1)) ]
  )

  if (missing(output_file)) {
    return(output_lines)
  } else {
    writeLines(output_lines, con = output_file)
    return(invisible(output_lines))
  }
}

# Example use
# From - https://stackoverflow.com/questions/62095329/how-to-edit-an-r-markdown-yaml-header-programmatically

change_yaml_matter("~/StackOverflow/1883604/62095186.Rmd",
                   output=list(ioslides_presentation=list(widescreen=TRUE)))
