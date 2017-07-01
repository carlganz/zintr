#include <R.h>
#include <Rdefines.h>
#include <stdio.h>
#include <zint.h>

SEXP barcode(SEXP code) {
  unsigned char *out = CHAR(STRING_ELT(code,0));
  struct zint_symbol *my_symbol;
  my_symbol = ZBarcode_Create();
  ZBarcode_Encode(my_symbol, out, 0);
  ZBarcode_Print(my_symbol, 0);
  ZBarcode_Delete(my_symbol);
  return code;
}