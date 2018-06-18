#' Helper function to allow printing an atomic vector
#' @param vector_convert A vector to be converted to character
#' @return Printable atmoic vector
#' @author Mayuresh Kinare
#' @keywords print, atmoic vector
#' @export
simplifyhelper.vectorprint <- function(vector_convert) {
  #Collapsing the atomic vector to a character
  vector_converted <- paste(vector_convert, collapse = ", ")

  #Returning the printable atomic vector
  return(vector_converted)
}
