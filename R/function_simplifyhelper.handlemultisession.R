#' Helper function to handle future::plan object
#' @param future_plan future::plan object to be scrubbed off the multisession object
#' @return Scrubbed future::plam object
#' @author Mayuresh Kinare
#' @keywords plan, multisession
#' @import future
#' @export
simplifyhelper.handlemultisession <- function(future_plan) {
  if (grepl("multisession", simplifyhelper.futureplanprint(future_plan))) {
    plan_processed <-
      suppressWarnings(map(future_plan, class) %>% map(`[[`, 1))

    position_multisession <-
      which(grepl("multisession", plan_processed) == TRUE)

    future_plan[position_multisession] = list(future::"multiprocess")
  }

  return(future_plan)
}
