*&---------------------------------------------------------------------*
*& Report Z_ALV_EXAMPLES
*&---------------------------------------------------------------------*
*& ALV Examples for Data Display
*&---------------------------------------------------------------------*

REPORT Z_ALV_EXAMPLES.

* Declaração de tabelas internas e estruturas
DATA: t_vbak_vbap TYPE TABLE OF vbak,   " Tabela interna para dados de cabeçalho
      t_prcd      TYPE TABLE OF prcd_elements, " Tabela interna para condições de preço
      t_academia  TYPE TABLE OF zacademia99_1, " Tabela interna para academia
      t_saida     TYPE TABLE OF ty_saida, " Tabela interna para saída

      wa_vbak_vbap TYPE ty_inner_vbak_vbap, " Work area para vbak e vbap
      wa_prcd      TYPE ty_prcd, " Work area para condições de preço
      wa_saida     TYPE ty_saida. " Work area para saída final

* Seleção de dados com ALV
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln,  " Faixa de seleção para número de documento
                s_erdat FOR vbak-erdat.  " Faixa de seleção para data de criação

PARAMETERS: p_kschl TYPE prcd_elements-kschl.  " Parâmetro para condição de preço

START-OF-SELECTION.
  PERFORM f_selecionar_dados.    " Seleciona os dados
  PERFORM f_manipular_dados.     " Manipula e prepara os dados para exibição
  PERFORM f_saida.               " Exibe os dados no ALV

*&---------------------------------------------------------------------*
*& Form f_selecionar_dados
*&---------------------------------------------------------------------*
*& Selecionar as informações que serão apresentadas no ALV
*&---------------------------------------------------------------------*
FORM f_selecionar_dados .

  " Seleciona dados de cabeçalho e itens da tabela VBAK e VBAP
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
    " Seleciona condições de preço das ordens de vendas
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

    " Seleciona dados da academia
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
*& Form f_manipular_dados
*&---------------------------------------------------------------------*
*& Preparar a tabela interna que será exibida no ALV
*&---------------------------------------------------------------------*
FORM f_manipular_dados .

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
*& Exibir dados no ALV
*&---------------------------------------------------------------------*
FORM f_saida .

  DATA: mo_salv_table TYPE REF TO cl_salv_table,
        mo_functions  TYPE REF TO cl_salv_functions_list,
        mo_display    TYPE REF TO cl_salv_display_settings,
        mo_columns    TYPE REF TO cl_salv_columns_table.

  " Cria a instância da tabela ALV
  CALL METHOD cl_salv_table=>factory
    EXPORTING
      list_display = if_salv_c_bool_sap=>false
    IMPORTING
      r_salv_table = mo_salv_table
    CHANGING
      t_table      = t_saida.

  " Ativa os botões de funções do ALV
  mo_functions = mo_salv_table->get_functions( ).
  mo_functions->set_all( abap_true ).

  " Ativa o padrão zebra
  mo_display = mo_salv_table->get_display_settings( ).
  mo_display->set_striped_pattern( cl_salv_display_settings=>true ).

  " Otimiza as colunas
  mo_columns = mo_salv_table->get_columns( ).
  mo_columns->set_optimize( abap_true ).

  " Exibe a tabela ALV
  mo_salv_table->display( ).

ENDFORM.
