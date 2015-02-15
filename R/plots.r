#' Head circumference for age

circumference_for_age <- function(circumference = NULL, age = NULL, gender = "male", unit.length = "in") {
  build_plot(circumference, age, gender, unit.length)
}


#' Head circumference for age

weight_for_length <- function(weight = NULL, length = NULL, gender = "male", unit.length = "lb") {
  build_plot(weight, length, gender, unit.length)
}

build_plot <- function(...) {

  # parse arguments
  args <- structure(list(...), names = as.character(match.call()[-1]))
  args$gender <- check_gender(args$gender)

  # find corresponding data table
  tbl.code <- paste(names(args)[1:2], collapse = ".")
  df <- .table[[tbl.code]]
  if (is.null(df)) stop(tbl.code, " data is not available.", call. = FALSE)

  df <- filter(df, gender == args$gender) %>% select(-gender)

  # rename category to matching variables
  xy <- names(args)[1:2]
  xy <- c(age = "month", circumference = "circumference")[xy]

  ggvis(df) %>%
   group_by(percentile) %>%
   layer_points(prop("x", as.name(xy[1])),
                prop("y", as.name(xy[2])))
}
