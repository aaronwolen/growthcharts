#' Head circumference for age

circumference_for_age <- function(circumference = NULL, age = NULL, gender = "male", unit.length = "cm") {
  build_plot(circumference, age, gender, unit.length)
}


#' Weight for length

weight_for_length <- function(weight = NULL, length = NULL, gender = "male", unit.length = "kg") {
  build_plot(weight, length, gender, unit.length)
}
