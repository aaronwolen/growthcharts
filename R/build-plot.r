
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

  labels <- sub("month", "months", xy)
  labels <- paste0(names(args)[2:1], " (", labels, ")")
  labels <- sub("(^\\w)", "\\U\\1", labels, perl = TRUE)

  # build plot
  colors <- sym_pal(args$palette, levels(df$percentile))
  df$color <- colors[df$percentile]

  df <- group_by(df, percentile)
  percent.df <- filter_(df, interp("x == max(x)", x = as.name(xy[2])))

  p <- df %>%
         ggvis(prop("x", as.name(xy[1])),
               prop("y", as.name(xy[2]))) %>%
         layer_paths(stroke :=~ color) %>%
         layer_text(data = percent.df, text := ~percentile,
                    dx := 5, baseline := "middle") %>%
         add_axis("x", title = labels[1]) %>%
         add_axis("y", title = labels[2])

  # add user data
  if (!all(vapply(args[1:2], is.null, logical(1)))) {
    user.df <- data.frame(setNames(args[2:1], xy))
    p <- layer_points(p, fill := args$color, stroke := "white", data = user.df)
  }
  print(p)
}
