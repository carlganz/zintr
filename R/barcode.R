#' Print barcodes
#' 
#' Use zint API to print barcodes
#' 
#' @param code Value to print as barcode
#' @export
#' @useDynLib zintr, .registration = TRUE
#' @examples 
#' \dontrun{
#' zintr::barcode_print("Hello World")
#' }
#' 

barcode_print <- function(code) {
  .Call("barcode", as.character(code), PACKAGE = "zintr")
}