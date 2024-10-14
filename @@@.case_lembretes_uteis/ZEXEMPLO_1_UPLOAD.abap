FORM f_upload .

  DATA: l_filename TYPE string.

  DATA: lwa_cliente TYPE ty_cliente,
        lwa_upload  TYPE ty_upload.

  DATA: t_upload TYPE TABLE OF ty_upload.

  l_filename = p_file.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename                = l_filename
    TABLES
      data_tab                = t_upload
    EXCEPTIONS
      file_open_error         = 1
      file_read_error         = 2
      no_batch                = 3
      gui_refuse_filetransfer = 4
      invalid_type            = 5
      no_authority            = 6
      unknown_error           = 7
      bad_data_format         = 8
      header_not_allowed      = 9
      separator_not_allowed   = 10
      header_too_long         = 11
      unknown_dp_error        = 12
      access_denied           = 13
      dp_out_of_memory        = 14
      disk_full               = 15
      dp_timeout              = 16
      OTHERS                  = 17.
  IF sy-subrc <> 0.
* Implement suitable error handling here
    EXIT.
  ELSE.

    LOOP AT t_upload INTO lwa_upload.

      SPLIT lwa_upload-dados AT cl_abap_char_utilities=>horizontal_tab
                   INTO lwa_cliente-nome
                   lwa_cliente-data
                   lwa_cliente-hora.
      APPEND lwa_cliente TO t_cliente.
      CLEAR lwa_cliente.

    ENDLOOP.

  ENDIF.

cl_demo_output=>display( t_cliente ).



ENDFORM.

FORM f_abrir_lista .

  DATA: l_FILENAME   TYPE string,
        it_filetable TYPE filetable,
        l_rc         TYPE i.

  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      window_title            = 'File Open'
      initial_directory       = 'C:'
    CHANGING
      file_table              = it_filetable
      rc                      = l_RC
    EXCEPTIONS
      file_open_dialog_failed = 1
      cntl_error              = 2
      error_no_gui            = 3
      OTHERS                  = 4.

  IF sy-subrc = 0.
    READ TABLE it_filetable INDEX 1 INTO l_FILENAME.
    IF sy-subrc IS INITIAL.
      p_file = l_filename.
    ENDIF.
  ELSE.
*      MESSAGE E100 WITH TEXT-011. " Error while opening the file
  ENDIF.

ENDFORM.