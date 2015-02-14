#' Head circumference for age

circumference_for_age <- function(circumference, age, gender = "male", unit.length = "in") {

  gender <- check_gender(gender)

  data <- .table$circumference.age %>%
            filter_(lazyeval::interp("gender == x", x = gender)) %>%
            select(-gender)

  data %>%
    group_by(percentile) %>%
    ggvis(~month, ~circumference, stroke = ~percentile) %>%
    layer_lines()
}


#' Head circumference for age

weight_for_length <- function(weight, length, gender = "male", unit.length = "lb") {

  gender <- check_gender(gender)

  data <- .table$weight.length %>%
    filter_(lazyeval::interp("gender == x", x = gender)) %>%
    select(-gender)

  data %>%
    group_by(percentile) %>%
    ggvis(~length, ~weight, stroke = ~percentile) %>%
    layer_lines()
}
