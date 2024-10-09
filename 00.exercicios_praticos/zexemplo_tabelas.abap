REPORT zexemplo_tabelas.

DATA: lt_vbak TYPE TABLE OF vbak,
      lt_vbap TYPE TABLE OF vbap,
      ls_vbak TYPE vbak,
      ls_vbap TYPE vbap.

SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.

SELECT * FROM vbak INTO TABLE lt_vbak WHERE vbeln IN s_vbeln.

IF lt_vbak IS NOT INITIAL.
  SELECT * FROM vbap INTO TABLE lt_vbap
    FOR ALL ENTRIES IN lt_vbak
    WHERE vbeln = lt_vbak-vbeln.

  SORT lt_vbak BY vbeln.
  LOOP AT lt_vbak INTO ls_vbak.
    WRITE: / 'Número de Venda:', ls_vbak-vbeln.
    
    READ TABLE lt_vbap INTO ls_vbap WITH KEY vbeln = ls_vbak-vbeln.
    IF sy-subrc = 0.
      WRITE: / 'Item encontrado:', ls_vbap-posnr.
    ENDIF.
  ENDLOOP.
ENDIF.