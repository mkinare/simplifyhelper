#' Helper function to remove certain symbols from the column names
#' @param data A data frame
#' @param columns A character vector of columns which to be stripped of the symbols, structure is c("Col1", "Col2", "Col3",.......)
#' @param splits A character vector of splits on which to be stripped of the symbols, structure is c("split_element1", "split_element2", "split_element3",.......)
#' @return Data table with new column names stripped of the error causing symbols
#' @author Mayuresh Kinare
#' @keywords Remove symbols
#' @import dplyr
#' @import data.table
#' @import magrittr
#' @import stringr
#' @export
simplifyhelper.removesymbols <- function(data, columns, splits) {
  # Need all the column names for filtering the data
  totallist <- c(splits, columns)

  # Converting them to symbol for using with the .dots nse declaration
  filt <- lapply(totallist, as.symbol)

  # Filtering the data
  temp <- data %>% dplyr::select_(.dots = filt)

  # New column names where . and - are removed
  columnsnew <- gsub("[[:punct:]]", "", columns)

  # New column names where "in" is removed
  #columnsnew <- gsub("in", "", columnsnew, ignore.case = TRUE)


  # New group names where whitespace is removed
  splitsnew <- gsub(" ", "", splits)

  # New group names where for is removed
  splitsnew <- gsub("for", "", splitsnew)

  # New group names where "in" is removed
  #splitsnew <- gsub("in", "", splitsnew, ignore.case = TRUE)


  #Removing all symbols
  splitsnew <- gsub("[[:punct:]]", "", splitsnew)

  #New data table names
  totallistnew <- c(splitsnew, columnsnew)

  # Renaming the data table to correct names
  data.table::setnames(temp, totallist, totallistnew)
  return(temp)
}
