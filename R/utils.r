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
