*&---------------------------------------------------------------------*
*& Report ZABAP06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP06.

TYPES: BEGIN OF ty_saida,
         vbeln    TYPE vbak-vbeln,
         posnr    TYPE vbap-posnr,
         material TYPE vbap-matnr,
       END OF ty_saida.

"VBAK -> header de documento
"VBAP -> item de documento

DATA: gt_header TYPE TABLE OF vbak,
      gt_item   TYPE TABLE OF vbap,
      gt_saida  TYPE TABLE OF ty_saida.

DATA: wa_header TYPE vbak,
      wa_item   TYPE vbap,
      wa_saida  TYPE ty_saida.

PARAMETERS p_KOKRS TYPE vbak-kokrs.


START-OF-SELECTION.

  "seleção do header
  SELECT *                    "lista de campos
    FROM vbak                 "tabela transparente de origem
    INTO TABLE gt_header      "tabela interna
    WHERE kokrs = p_kokrs.    "condição de seleção

  IF sy-subrc IS INITIAL.

    SELECT *
      FROM vbap
      INTO TABLE gt_item
      FOR ALL ENTRIES IN gt_header
      WHERE vbeln = gt_header-vbeln.

    IF sy-subrc IS INITIAL.

      SORT gt_item BY vbeln.

      LOOP AT gt_header INTO wa_header.

        READ TABLE gt_item INTO wa_item
        WITH KEY vbeln = wa_header-vbeln
                 BINARY SEARCH.

        IF sy-subrc IS INITIAL.

          wa_saida-vbeln = wa_header-vbeln.
          wa_saida-posnr = wa_item-posnr.
          wa_saida-material = wa_item-matnr.

          APPEND wa_saida TO gt_saida.
          CLEAR wa_saida.

        ENDIF.
      ENDLOOP.

    ENDIF.
  ENDIF.

  MESSAGE s000(00).