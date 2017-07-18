#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <stdio.h>
#include <zint.h>
#include <string.h>

SEXP barcode(SEXP code, SEXP outfile, SEXP symbologys, SEXP height) {
  unsigned char *out = CHAR(STRING_ELT(code,0));
  unsigned char *file = CHAR(STRING_ELT(outfile, 0));
  struct zint_symbol *my_symbol;
  my_symbol = ZBarcode_Create();
  my_symbol -> symbology = asInteger(symbologys);
  my_symbol -> height = asInteger(height);
  strcpy(my_symbol -> outfile, file);
  ZBarcode_Encode(my_symbol, out, 0);
  int zret = ZBarcode_Print(my_symbol, 0);
  SEXP outvalue = PROTECT(allocVector(INTSXP, 1));
  INTEGER(outvalue)[0] = zret;
  UNPROTECT(1);
  ZBarcode_Delete(my_symbol);
  return outvalue;
}