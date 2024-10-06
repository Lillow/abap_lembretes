REPORT ZSELECT_INNER_JOIN_1.

INCLUDE ZABAP06_WORKAREA_TABELAINTERNA. " Include das work áreas e tabelas internas

*Cenário 2:
*VBRK - vbeln - knumv
*VBRP - vbeln - posnr
*PRC_ELEMENTS - knumv

TABLES vbrk.

SELECT-OPTIONS s_vbeln FOR vbrk-vbeln OBLIGATORY.

START-OF-SELECTION.

  SELECT a~vbeln
         a~knumv
         a~fkart
         a~vbtyp
         a~waerk
         b~posnr
         b~uepos
         b~fkimg
         c~kposn
         c~stunr
         c~zaehk
    INTO TABLE ti_result_vbrk
    FROM vbrk AS a
    INNER JOIN vbrp AS b
    ON a~vbeln = b~vbeln
    INNER JOIN prcd_elements AS c
    ON  a~knumv = c~knumv
    WHERE a~vbeln = s_vbeln
   and b~posnr = c~kposn.


END-OF-SELECTION.

  cl_demo_output=>display( ti_result_vbrk ).