*&---------------------------------------------------------------------*
*& Include          ZABAP06_REL_VENDAS_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_selecionar_dados
*&---------------------------------------------------------------------*
*& Selecionar as informações que serão apresentadas no ALV de saída
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_selecionar_dados .

* Dados de cabeçalho da Ordem de vendas
  SELECT k~vbeln
         k~auart
         p~posnr
         p~matnr
         p~arktx
         p~kwmeng
         p~vrkme
         p~knumv_ana
    FROM vbak AS k
    INNER JOIN vbap AS p
    ON k~vbeln = p~vbeln
    INTO TABLE t_vbak_vbap
    WHERE k~vbeln IN s_vbeln.

  IF sy-subrc IS INITIAL.
    SORT t_vbak_vbap BY vbeln.
  ENDIF.

  IF t_vbak_vbap IS NOT INITIAL.
* Selecionar as condições de preço das Ordens de vendas
    SELECT knumv
           kposn
           kawrt
           kbetr
           waerk
     FROM prcd_elements
      INTO TABLE t_prcd
      FOR ALL ENTRIES IN t_vbak_vbap
      WHERE knumv = t_vbak_vbap-knumv_ana
        AND kposn = t_vbak_vbap-posnr
        AND kschl = p_kschl.
    IF sy-subrc IS INITIAL.
      SORT t_prcd BY knumv kposn.
    ENDIF.

    SELECT *
      FROM zacademia99_1
      INTO TABLE t_academia
     WHERE vbeln IN s_vbeln.
    IF sy-subrc IS INITIAL.
      SORT t_academia BY vbeln posnr.
    ENDIF.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form F_MANIPULAR_DADOS
*&---------------------------------------------------------------------*
*& Criar a tabela interna que será exibida na saída do relatório
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_manipular_dados .

  DATA: wa_vbak_vbap TYPE ty_inner_vbak_vbap,
        wa_prcd      TYPE ty_prcd,
        wa_saida     TYPE ty_saida.

  LOOP AT t_vbak_vbap INTO wa_vbak_vbap.
    READ TABLE t_prcd INTO wa_prcd WITH KEY knumv = wa_vbak_vbap-knumv_ana
                                            kposn = wa_vbak_vbap-posnr
                                   BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      wa_saida-vbeln = wa_vbak_vbap-vbeln.
      wa_saida-auart = wa_vbak_vbap-auart.
      wa_saida-posnr = wa_vbak_vbap-posnr.
      wa_saida-matnr = wa_vbak_vbap-matnr.
      wa_saida-arktx = wa_vbak_vbap-arktx.
      wa_saida-kwmeng = wa_vbak_vbap-kwmeng.
      wa_saida-vrkme = wa_vbak_vbap-vrkme.

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
        EXPORTING
          input  = wa_vbak_vbap-knumv_ana
        IMPORTING
          output = wa_saida-knumv_ana.

      wa_saida-kposn = wa_prcd-kposn.
      wa_saida-kawrt = wa_prcd-kawrt.
      wa_saida-kbetr = wa_prcd-kbetr.
      wa_saida-waers = wa_prcd-waers.

      APPEND wa_saida TO t_saida.
      CLEAR wa_saida.

    ENDIF.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_saida
*&---------------------------------------------------------------------*
*& Geração da lista de saida
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_saida .

* Nome da Instancia do ALV dentro do programa
  DATA: mo_salv_table TYPE REF TO cl_salv_table,
        mo_functions  TYPE REF TO cl_salv_functions_list,       "ALV Functions
        mo_display    TYPE REF TO cl_salv_display_settings,     "ALV display settings
        mo_columns    TYPE REF TO cl_salv_columns_table,        "ALV Columns table
        mo_column     TYPE REF TO cl_salv_column_table.         "ALV Propriety Column

* Create an instance of the SALV table object
  CALL METHOD cl_salv_table=>factory
    EXPORTING
      list_display = if_salv_c_bool_sap=>false
    IMPORTING
      r_salv_table = mo_salv_table
    CHANGING
      t_table      = t_saida.

**Enable function buttons
  mo_functions = mo_salv_table->get_functions( ).
  mo_functions->set_all( abap_true ).

**Enable Zebra style
  mo_display = mo_salv_table->get_display_settings( ).
  mo_display->set_striped_pattern( cl_salv_display_settings=>true ).

**Optimize Column
  mo_columns = mo_salv_table->get_columns( ).
  mo_columns->set_optimize( abap_true ).

  mo_column ?= mo_columns->get_column( columnname = 'MANDT' ).
  mo_column->set_visible( value  = abap_false ).

  mo_salv_table->display( ).


ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_gravar_dados_tabela
*&---------------------------------------------------------------------*
*& Grava rdados na tabela transparente
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_gravar_dados_tabela .

  DATA: lt_saida_delete  TYPE TABLE OF ty_saida,
        lwa_saida_delete TYPE ty_saida.

  lt_saida_delete = t_saida.

  LOOP AT lt_saida_delete INTO lwa_saida_Delete.
    READ TABLE t_academia WITH KEY vbeln = lwa_saida_Delete-vbeln
                                   posnr = lwa_saida_Delete-posnr
                          TRANSPORTING NO FIELDS
                          BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      DELETE TABLE lt_saida_delete FROM lwa_saida_Delete.
    ENDIF.
  ENDLOOP.

  IF lt_saida_delete IS NOT INITIAL.
    INSERT zacademia99_1 FROM TABLE lt_saida_delete.
    IF sy-subrc = 0.
      COMMIT WORK AND WAIT.
    ELSE.
      ROLLBACK WORK.
    ENDIF.
  ENDIF.

ENDFORM.