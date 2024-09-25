*&---------------------------------------------------------------------*
*& Report ZOPERADORES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoperadores.

* Operadores Aritméticos


DATA: v_a      TYPE i VALUE 5,
      v_b      TYPE i VALUE 10,
      v_result TYPE i.

" Adição
v_result = v_a + v_b. " v_result = 15

" Subtração
v_result = v_b - v_a. " v_result = 5

" Multiplicação
v_result = v_a * v_b. " v_result = 50

" Divisão
v_result = v_b / v_a. " v_result = 2.0

" Divisão inteira
v_result = v_a DIV v_b. " v_result = 2

" Resto da Divisão
v_result = v_b MOD v_a. " v_result = 0

************************************************************************************************************************************

* Operadores relacionais

" Igual a
IF v_a = v_b.
  WRITE: / 'Iguais'.
ENDIF.

" Diferente de (<> ou ≠)
IF v_a <> v_b.
  WRITE: / 'Diferentes'.
ENDIF.

" Maior que
IF v_a > v_b.
  WRITE: / 'v_a é maior'.
ENDIF.

" Menor que
IF v_a < v_b.
  WRITE: / 'v_a é menor'.
ENDIF.

" Maior ou igual a
IF v_a >= v_b.
  WRITE: / 'v_a é maior ou igual'.
ENDIF.


" Menor ou igual a
IF v_a <= v_b.
  WRITE: / 'v_a é menor ou igual'.
ENDIF.

************************************************************************************************************************************

* Operadores Lógicos

" E
IF v_a < v_b AND v_a > 0.
  WRITE: / 'v_a está entre 0 e v_b'.
ENDIF.

" OU
IF v_a < 0 OR v_b < 0.
  WRITE: / 'Pelo menos um valor é negativo'.
ENDIF.

" NOT
IF NOT v_a = v_b.
  WRITE: / 'v_a é diferente de v_b'.
ENDIF.

************************************************************************************************************************************

* Exemplo completo:

DATA: v_a_1      TYPE i VALUE 5,
      v_b_1      TYPE i VALUE 10,
      v_result_1 TYPE i.

" Operações Aritméticas
v_result = v_a + v_b. " Soma
WRITE: / 'Soma:', v_result.

v_result = v_b - v_a. " Subtração
WRITE: / 'Subtração:', v_result.

v_result = v_a * v_b. " Multiplicação
WRITE: / 'Multiplicação:', v_result.

v_result = v_b / v_a. " Divisão
WRITE: / 'Divisão:', v_result.

v_result = v_b MOD v_a. " Resto
WRITE: / 'Resto da divisão:', v_result.

" Comparações Relacionais
IF v_a = v_b.
  WRITE: / 'Iguais'.
ELSE.
  WRITE: / 'Diferentes'.
ENDIF.

" Condições Lógicas
IF v_a < v_b AND v_a > 0.
  WRITE: / 'v_a está entre 0 e v_b'.
ENDIF.

IF v_a < 0 OR v_b < 0.
  WRITE: / 'Pelo menos um valor é negativo'.
ENDIF.

IF NOT v_a = v_b.
  WRITE: / 'v_a é diferente de v_b'.
ENDIF.




DATA: lv_a TYPE i VALUE 10,
      lv_b TYPE i VALUE 3,
      lv_result TYPE i.
