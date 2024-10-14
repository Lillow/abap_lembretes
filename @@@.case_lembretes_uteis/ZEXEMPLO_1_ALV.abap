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
