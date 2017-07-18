#' Print barcodes
#'
#' Use zint API to print barcodes
#'
#' @param code Value to print as barcode
#' @param outfile File to print
#' @param symbology Barcode type see \url{http://www.zint.org.uk/Manual.aspx?type=p&page=5}
#' @param height Integer indicating height. Ignored for some symbologies.
#' @export
#' @useDynLib zintr, .registration = TRUE
#' @examples
#' \dontrun{
#' zintr::barcode_print("Hello World")
#' }
#'

barcode_print <-
  function(code,
           outfile = "out.png",
           symbology = 20L,
           height = 50L) {
    .Call(
      "barcode",
      as.character(code),
      as.character(outfile),
      as.integer(symbology),
      as.integer(height),
      PACKAGE = "zintr"
    )
  }