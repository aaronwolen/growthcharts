# Download WHO child growth data

library(rvest)
library(stringr)
library(dplyr)
library(tidyr)

urls <- list("http://www.cdc.gov/growthcharts/who/boys_weight_head_circumference.htm",
             "http://www.cdc.gov/growthcharts/who/boys_length_weight.htm",
             "http://www.cdc.gov/growthcharts/who/girls_weight_head_circumference.htm",
             "http://www.cdc.gov/growthcharts/who/girls_length_weight.htm")

tables <- lapply(urls, html)

# table descriptions
labels <- lapply(tables, html_nodes, "caption")
labels <- unlist(lapply(labels, html_text))

gender <- str_extract(labels, "Boy|Girl")

labels <- str_replace(labels, "(Boys|Girls) ", "")
labels <- str_split_fixed(labels, " Percentiles, ", 2)[, 1]

description <- labels

# table ID codes
labels <- str_replace(tolower(labels), "-for-", ".")
labels <- str_replace(labels, "head ", "")

# combine
tables <- lapply(tables, html_table)
tables <- do.call("c", tables)
tables <- Map(data.frame, gender = gender, tables)

# split by data type
.table <- split(tables, labels)
.table <- lapply(.table, rbind_all)

# reshape
.table <- lapply(.table, select, -L, -M, -S)

gather_cols <- lapply(.table, colnames)
gather_cols <- lapply(gather_cols, Filter, f = function(x) str_detect(x, "^X"))

values <- str_split_fixed(names(.table), fixed("."), 2)[, 1]

.table <- Map(gather_, .table, "percentile", values, gather_cols)

# cleanup
clean_percentile <- function(x) {
  out <- str_split_fixed(as.character(x), fixed("."), 2)[, 1]
  out <- str_replace(out, "^X", "")
  factor(out, unique(out))
}

.table <- lapply(.table, mutate, percentile = clean_percentile(percentile))

# descriptions
attr(.table, "description") <- description[match(names(.table), labels)]

# export
save(.table, file = "R/sysdata.rda")
