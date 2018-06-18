#' #' Helper function to create a data table from vector of split with contents of the split
#' @param data The data table from which we have to create the split
#' @param column_split An column name which is used as a split column
#' @return Table containing the object and the content of the object from the data table which was passed
#' @author Mayuresh Kinare
#' @keywords split, splittodata
#' @import dplyr
#' @import data.table
#' @import purrr
#' @importFrom rlang .data
#' @export
simplifyhelper.splittodata <- function(data, column_split) {
  temp <- levels(factor(data[[column_split]]))

  data_columns_split_content <-
    simplifyhelper.listtodata(column_y = column_split, object_x = temp) %>% rename(column_split = .data$column_y, column_split_content = .data$column_x) %>% unique

  return(data_columns_split_content)
}
