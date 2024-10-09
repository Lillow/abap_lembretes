*&---------------------------------------------------------------------*
*& Report ZABAP06_EXEMPLO_TABELAS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap06_exemplo_tabelas.

DATA: t_vbak  TYPE TABLE OF vbak,
      t_vbap  TYPE TABLE OF vbap,
      ws_vbak TYPE vbak,
      ws_vbap TYPE vbap.

TABLES vbak.

SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.

SELECT * FROM vbak INTO TABLE t_vbak WHERE vbeln IN s_vbeln.

IF t_vbak IS NOT INITIAL.
  SELECT * FROM vbap INTO TABLE t_vbap
    FOR ALL ENTRIES IN t_vbak
    WHERE vbeln = t_vbak-vbeln.

  SORT t_vbak BY vbeln.
  LOOP AT t_vbak INTO ws_vbak.
    WRITE: / 'Número de Venda: ', ws_vbak-vbeln.

    READ TABLE t_vbap INTO ws_vbap WITH  KEY vbeln = ws_vbak-vbeln.



    IF sy-subrc = 0.
      WRITE: / 'Item encontrado: ', ws_vbap-posnr.
    ENDIF.
  ENDLOOP.


ENDIF.