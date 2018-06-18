#' Helper function to create a data table from a vector of columns
#' @param column_y vector that need to be joined with the object_x
#' @param object_x An object to create the combination
#' @return Table containing data table for all possible combinations of the column_y and object_x
#' @author Mayuresh Kinare
#' @keywords listtodata
#' @import dplyr
#' @import data.table
#' @import purrr
#' @export
simplifyhelper.listtodata <- function(column_y, object_x) {
  #Creating a list of same size as the one passed to us
  temp_list <- c(rep(object_x, length(column_y)))
  #Creating a  data table to be used
  data <- data.table(column_y = column_y, column_x = temp_list)

  return(data)
}
