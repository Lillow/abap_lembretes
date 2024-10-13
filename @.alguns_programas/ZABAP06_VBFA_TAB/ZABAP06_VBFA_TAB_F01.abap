*&---------------------------------------------------------------------*
*& Include          ZABAP06_VBFA_TAB_F01
*&---------------------------------------------------------------------*

FORM f_chamar_funcao.
  DATA: lwa_comwa         TYPE vbco6,
        itl_vbfa          TYPE TABLE OF vbfas,
        itl_RETURN        TYPE TABLE OF bapiret2,
        itl_ORDERITEMS    TYPE TABLE OF bapisditbos,
        itl_ORDERPARTNERS TYPE TABLE OF bapisdpart.
  lwa_comwa-vbeln = p_vbeln.

  CALL FUNCTION 'RV_ORDER_FLOW_INFORMATION'
    EXPORTING
      comwa         = lwa_comwa
    TABLES
      vbfa_tab      = itl_vbfa
    EXCEPTIONS
      no_vbfa       = 1
      no_vbuk_found = 2
      OTHERS        = 3.


  IF sy-subrc = 0.
* Implement suitable error handling here
    CALL FUNCTION 'BAPI_SALESORDER_GETDETAILBOS'
      EXPORTING
        salesdocument = lwa_comwa-vbeln
*       INTERNALUSE   = ' '
* IMPORTING
*       ORDERHEADER   =
      TABLES
        return        = itl_RETURN
        orderitems    = itl_orderitems
        orderpartners = itl_ORDERPARTNERS.



  ENDIF.

*  Nome da Instancia do alv dentro do programa
 data: mo_salv_table type ref to cl_salv_table,
       mo_functions  type ref to cl_salv_functions_list,       "ALV Functions
       mo_display    type ref to cl_salv_display_settings,     "ALV display settings
       mo_columns    type ref to cl_salv_columns_table,        "ALV Columns table
       mo_column     type ref to cl_salv_column_table.         "ALV Propriety Column

* Create an instance of the SALV table object
  CALL METHOD cl_salv_table=>factory
    EXPORTING
      list_display = if_salv_c_bool_sap=>false
    IMPORTING
      r_salv_table = mo_salv_table
    CHANGING
      t_table      = itl_vbfa. " Tabela de saída

*Enable function buttons
  mo_functions = mo_salv_table->get_functions( ).
  mo_functions->set_all( abap_true ).

*Enable Zebra style
  mo_display = mo_salv_table->get_display_settings( ).
  mo_display->set_striped_pattern( cl_salv_display_settings=>true ).

*Optimize Column
  mo_columns = mo_salv_table->get_columns( ).
  mo_columns->set_optimize( abap_true ).

  mo_column ?= mo_columns->get_column( columnname = 'MANDT' ).
  mo_column->set_visible( value  = abap_false ).

  mo_salv_table->display( ).

ENDFORM.