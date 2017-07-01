#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP barcode(SEXP);

static const R_CallMethodDef CallEntries[] = {
  {"barcode", (DL_FUNC) &barcode, 1},
  {NULL, NULL, 0}
};

void R_init_zintr(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}