#' Helper function to create a character of the future::plan object
#' @param future_plan future::plan object to be converted to character string for printing
#' @return Printable plan of future
#' @author Mayuresh Kinare
#' @keywords plan
#' @import future
#' @export
simplifyhelper.futureplanprint <- function(future_plan) {
  info <-
    map(future_plan, class) %>% map(`[[`, 1) %>% flatten_chr %>% as.character %>% paste0(collapse = ", ")

  return(info)
}
