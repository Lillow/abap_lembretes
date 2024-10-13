*&---------------------------------------------------------------------*
*& Report ZSEL
*&---------------------------------------------------------------------*
* Lógica de eventos de tela de seleção
INITIALIZATION.
  WRITE: 'Inicializando parâmetros...' COLOR COL_GROUP KEY.

AT SELECTION-SCREEN.
  WRITE: 'Validação dos parâmetros...' COLOR COL_GROUP KEY.

  * Validação dos parâmetros
  IF p_num1 <= 0 OR p_num2 <= 0.
    MESSAGE 'Os números devem ser maiores que 0!' TYPE 'E'.
  ENDIF.
