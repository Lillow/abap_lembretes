*&---------------------------------------------------------------------*
*& Report ZABAP06_PERFORM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap06_perform.

* USING

FORM my_subroutine USING value1 TYPE i
                          value2 TYPE i.
  DATA(result) = value1 + value2.
  WRITE: / 'Resultado:', result.
ENDFORM.

***********************************************************************************************************************************

* CHANGING

FORM my_subroutine CHANGING var1 TYPE i
                             var2 TYPE i.
  var1 = var1 + 5.
  var2 = var2 + 10.
ENDFORM.

DATA(var1) = 10.
DATA(var2) = 20.

PERFORM my_subroutine CHANGING var1 var2.
WRITE: / 'Var1:', var1, 'Var2:', var2.

***********************************************************************************************************************************

* TABLES

FORM my_subroutine TABLES my_table STRUCTURE my_structure.
  LOOP AT my_table INTO DATA(line).
    line-field1 = line-field1 + 1.
    MODIFY TABLE my_table FROM line.
  ENDLOOP.
ENDFORM.

DATA: lt_my_table TYPE TABLE OF my_structure,
      ls_my_line  TYPE my_structure.

" Preencher lt_my_table...

PERFORM my_subroutine TABLES lt_my_table.