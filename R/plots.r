#' Head circumference for age
#' @export
circumference_for_age <- function(circumference = NULL, age = NULL, gender = "male", units = c("cm", "month")) {
  build_plot(circumference, age, gender, units)
}


#' Weight for length
#' @export
weight_for_length <- function(weight = NULL, length = NULL, gender = "male", units = c("kg", "cm")) {
  build_plot(weight, length, gender, units)
}


#' Length for age
#' @export
length_for_age <- function(length = NULL, age = NULL, gender = "male", units = c("cm", "month")) {
  build_plot(length, age, gender, units)
}


#' Weight for age
#' @export
weight_for_age <- function(weight = NULL, age = NULL, gender = "male", units = c("kg", "month")) {
  build_plot(weight, age, gender, units)
}
