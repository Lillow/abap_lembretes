REPORT ZCONDICIONAIS.


DATA: v_a TYPE i VALUE 10.

* SE | SENAO SE | SENÂO
" SE
IF v_a > 5.
  WRITE: / 'v_a é maior que 5'.
ENDIF.

" SENÂO
IF v_a > 5.
  WRITE: / 'v_a é maior que 5'.
ELSE.
  WRITE: / 'v_a não é maior que 5'.
ENDIF.

" SENÂO SE
IF v_a > 10.
  WRITE: / 'v_a é maior que 10'.
ELSEIF v_a = 10.
  WRITE: / 'v_a é igual a 10'.
ELSE.
  WRITE: / 'v_a é menor que 10'.
ENDIF.

************************************************************************************************************************************

* CASE Statement

DATA: v_grade TYPE c LENGTH 1 VALUE 'B'.

CASE v_grade.
  WHEN 'A'.
    WRITE: / 'Excelente'.
  WHEN 'B'.
    WRITE: / 'Bom'.
  WHEN 'C'.
    WRITE: / 'Satisfatório'.
  WHEN OTHERS.
    WRITE: / 'Nota inválida'.
ENDCASE.