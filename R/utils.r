# Check gender
check_gender <- function(x) {

  sex <- list(Boy =  c("male",   "boy"),
             Girl =  c("female", "girl"))

  match <- lapply(sex, grep, pattern = paste0("^", x), ignore.case = TRUE)
  hits  <- sapply(match, length)
  if (any(hits)) {
    return(names(match[which(hits > 0)]))
  } else {
    stop("Unrecognized gender.", call. = FALSE)
  }
}


# conversions
convert <- function(x, from, to) {

  units <- list(cm = c("cm" = 1,
                       "in" = 0.393701),
                kg = c("kg" = 1,
                       "lb" = 2.20462),
             month =  c("month" = 1))

  if (from == "month" & to != "month") {
    warning("Currently age can only be expressed in months.", call. = FALSE)
    to <- "month"
  }

  from <- match.arg(from, names(units))
  to   <- match.arg(to,   names(units[[from]]))

  x * units[[from]][to]
}

