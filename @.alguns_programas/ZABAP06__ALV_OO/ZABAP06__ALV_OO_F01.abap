*&---------------------------------------------------------------------*
*& Include          ZABAP06__ALV_OO_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_main
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_main .

  DATA: t_vbak TYPE tyb_vbak.

  PERFORM f_Selecionar_dados CHANGING t_vbak.  "Seleciona dados para
  "exibição

  IF t_vbak IS INITIAL.
* Mensagem de erro
    MESSAGE e000.
  ELSE.
    PERFORM f_output USING t_vbak.  "Apresenta o relatorio de saida
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_Selecionar_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- T_VBAK
*&---------------------------------------------------------------------*
FORM f_Selecionar_dados  CHANGING p_vbak TYPE tyb_vbak.

  SELECT  vbeln
          auart
          erdat
          erzet
          ernam
    FROM vbak
    INTO TABLE p_vbak
   WHERE erdat IN s_erdat.
  IF sy-subrc IS INITIAL.
    SORT p_vbak BY vbeln.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_output
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> T_VBAK
*&---------------------------------------------------------------------*
FORM f_output  USING p_vbak TYPE tyb_vbak.

* Nome da Instancia do ALV dentro do programa
  DATA: mo_salv_table TYPE REF TO cl_salv_table,
        mo_functions  TYPE REF TO cl_salv_functions_list,       "ALV Functions
        mo_display    TYPE REF TO cl_salv_display_settings,     "ALV display settings
        mo_columns    TYPE REF TO cl_salv_columns_table.        "ALV Columns table

* Create an instance of the SALV table object
  CALL METHOD cl_salv_table=>factory
    EXPORTING
      list_display = if_salv_c_bool_sap=>false
    IMPORTING
      r_salv_table = mo_salv_table
    CHANGING
      t_table      = p_vbak.

**Enable function buttons
  mo_functions = mo_salv_table->get_functions( ).
  mo_functions->set_all( abap_true ).

*  CALL METHOD mo_functions->add_function
*    EXPORTING
*      name       = 'LOCK USER'
*      icon       = 'ICON_LOCKED'
*      text       = 'Lock'
*      tooltip    = 'lOCK SELECTED USER'
*      position   = if_salv_c_function_position=>right_of_salv_functions.

**Enable Zebra style
      mo_display = mo_salv_table->get_display_settings( ).

  mo_display->set_striped_pattern( cl_salv_display_settings=>true ).

**Optimize Column
  mo_columns = mo_salv_table->get_columns( ).
  mo_columns->set_optimize( abap_true ).

  PERFORM f_update_columns USING: mo_columns 'VBELN' TEXT-001,
                                  mo_columns 'AUART' TEXT-002.

  mo_salv_table->display( ).


ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_update_columns
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> MO_COLUMNS
*&      --> P_
*&      --> TEXT_002
*&---------------------------------------------------------------------*
FORM f_update_columns USING  p_columns  TYPE REF TO cl_salv_columns_table
                             p_colum    TYPE lvc_fname
                             p_label    TYPE scrtext_l.

  DATA: lv_short  TYPE scrtext_s,
        lv_medium TYPE scrtext_m,
        lv_long   TYPE scrtext_l.

  DATA: lo_column     TYPE REF TO cl_salv_column.

  DATA not_found TYPE REF TO cx_salv_not_found.

  lv_short  = lv_medium  = lv_long  = p_label.

  TRY.
      lo_column = p_columns->get_column( p_colum ).
      lo_column->set_short_text( lv_short ).
      lo_column->set_medium_text( lv_medium ).
      lo_column->set_long_text( lv_long ).
    CATCH cx_salv_not_found INTO not_found.
      RETURN.
  ENDTRY.

ENDFORM.