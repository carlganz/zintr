#' Print barcodes
#' 
#' Use zint API to print barcodes
#' 
#' @param code Value to print as barcode
#' @param outfile File to print
#' @export
#' @useDynLib zintr, .registration = TRUE
#' @examples 
#' \dontrun{
#' zintr::barcode_print("Hello World")
#' }
#' 

barcode_print <- function(code, outfile = "out.png") {
  .Call("barcode", as.character(code), as.character(outfile), PACKAGE = "zintr")
}