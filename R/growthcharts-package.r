#' Growth charts
#'
#' Growth charts for infants and children ages 0 to 2 using the World Health
#' Organization's child growth standards.
#'
#' @author
#' Aaron Wolen \email{aaron@@wolen.com}
#'
#' Maintainer: Aaron Wolen \email{aaron@@wolen.com}
#' @name growthcharts
#' @docType package
#' @importFrom magrittr %>%
#' @importFrom dplyr filter filter_ select group_by
#' @importFrom ggvis ggvis layer_paths layer_points layer_text prop add_axis
#' @importFrom scales brewer_pal
#' @importFrom lazyeval interp
NULL


#' WHO Growth Standards
#'
#' Growth charts are generated using summary statistics calculated using the
#' World Health Organization's Child Growth Standards and made available by the
#' Centers for Disease Control.
#'
#' @references
#' WHO Multicentre Growth Reference Study Group. \href{http://www.who.int/entity/childgrowth/standards/Technical_report.pdf}{WHO Child Growth Standards: Length/height-for-age, weight-for-age, weight-for-length, weight-for-height and body mass index-for-age: Methods and development}. Geneva: World Health Organization, 2006
#' @docType data
#' @name growthdata
NULL
