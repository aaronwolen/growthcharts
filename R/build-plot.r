
build_plot <- function(...) {

  # parse arguments
  args <- structure(list(...), names = as.character(match.call()[-1]))
  args$gender <- check_gender(args$gender)

  # find corresponding data table
  tbl.code <- paste(names(args)[1:2], collapse = ".")
  df <- .table[[tbl.code]]
  if (is.null(df)) stop(tbl.code, " data is not available.", call. = FALSE)

  df <- filter(df, gender == args$gender) %>% select(-gender)

  # rename arguments to matching variable names
  args$units <- rev(args$units)
  xy <- names(args)[2:1]
  xy <- c(age = "month", circumference = "cm", length = "cm", weight = "kg")[xy]

  # unit conversions
  df[[args$units[1]]] <- convert(df[[xy[1]]], xy[1], args$units[1])
  df[[args$units[2]]] <- convert(df[[xy[2]]], xy[2], args$units[2])
  xy <- args$units

  # plot
  colors <- sym_pal(args$palette, levels(df$percentile))
  df$color <- colors[df$percentile]

  df <- group_by(df, percentile)
  p.df <- filter_(df, interp("x == max(x)", x = as.name(xy[2])))

  df %>%
    ggvis(prop("x", as.name(xy[1])),
          prop("y", as.name(xy[2]))) %>%
    layer_paths(stroke :=~ color) %>%
    layer_text(data = p.df, text := ~percentile, dx := 5, baseline := "middle")
}
