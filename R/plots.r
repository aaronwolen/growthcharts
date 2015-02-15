#' Head circumference for age
#' @export
circumference_for_age <- function(circumference = NULL, age = NULL, gender = "male", unit.length = "cm") {
  build_plot(circumference, age, gender, unit.length)
}


#' Weight for length
#' @export
weight_for_length <- function(weight = NULL, length = NULL, gender = "male", unit.length = "kg") {
  build_plot(weight, length, gender, unit.length)
}


#' Length for age
#' @export
length_for_age <- function(length = NULL, age = NULL, gender = "male", unit.length = "cm") {
  build_plot(length, age, gender, unit.length)
}


#' Weight for age
#' @export
weight_for_age <- function(weight = NULL, age = NULL, gender = "male", unit.length = "kg") {
  build_plot(weight, age, gender, unit.length)
}
