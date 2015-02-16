#' Head circumference for age
#'
#' @param circumference head circumference
#' @param age age in months at the time of trait measurment
#' @param gender (\code{male} or \code{female})
#' @param units character vector indicating the units of measures used for the
#'   plotted traits
#' @param palette color brewer palette applied to percentiles
#' @export
circumference_for_age <- function(circumference = NULL, age = NULL, gender = "male", units = c("cm", "month"), palette = "Greys") {
  build_plot(circumference, age, gender, units, palette)
}


#' Weight for length
#' @param weight child's weight
#' @param length child's length
#' @inheritParams circumference_for_age
#' @export
weight_for_length <- function(weight = NULL, length = NULL, gender = "male", units = c("kg", "cm"), palette = "Greys") {
  build_plot(weight, length, gender, units, palette)
}


#' Length for age
#' @inheritParams weight_for_length
#' @inheritParams circumference_for_age
#' @export
length_for_age <- function(length = NULL, age = NULL, gender = "male", units = c("cm", "month"), palette = "Greys") {
  build_plot(length, age, gender, units, palette)
}


#' Weight for age
#' @inheritParams weight_for_length
#' @inheritParams circumference_for_age
#' @export
weight_for_age <- function(weight = NULL, age = NULL, gender = "male", units = c("kg", "month"), palette = "Greys") {
  build_plot(weight, age, gender, units, palette)
}
