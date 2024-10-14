*&---------------------------------------------------------------------*
*& Report ZABAP06_EXERCICIO_MATERIAIS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap06_exercicio_materiais.

DATA: t_mara  TYPE TABLE OF mara,
      wa_mara TYPE mara.

TABLES mara.

PARAMETERS: p_print TYPE c LENGTH 1.

SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.

START-OF-SELECTION.

  PERFORM f_selecionar_dados.

  IF t_mara IS INITIAL.
    WRITE: / 'Não existem materiais para o intervalo selecionado'.
    EXIT.
  ENDIF.

  PERFORM f_exibir_dados.
  PERFORM f_imprimir_relatorio.

FORM f_selecionar_dados.
  SELECT *
    FROM mara
    INTO TABLE t_mara
    WHERE matnr IN s_matnr.

  IF sy-subrc = 0.
    SORT t_mara BY matnr.
  ENDIF.
ENDFORM.

FORM f_exibir_dados.
  LOOP AT t_mara INTO wa_mara.
    WRITE: / wa_mara-matnr,
           wa_mara-ersda,
           wa_mara-created_at_time.
  ENDLOOP.
ENDFORM.

FORM f_imprimir_relatorio.
  DATA: lv_print TYPE c LENGTH 1.

  WRITE: / 'Deseja imprimir o relatório? (S/N)'.

  IF p_print = 'S'.
    LOOP AT t_mara INTO wa_mara.
      " Aqui você pode adicionar a lógica de impressão
      " Para este exemplo, apenas exibe uma mensagem de impressão
      WRITE: / 'Imprimindo material:', wa_mara-ersda, wa_mara-created_at_time.
    ENDLOOP.
  ELSE.
    WRITE: / 'Relatório não será impresso.'.
  ENDIF.
ENDFORM.