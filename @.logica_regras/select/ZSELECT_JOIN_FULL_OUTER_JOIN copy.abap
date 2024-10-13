REPORT SELECT_JOIN_FULL_OUTER_JOIN.

DATA: it_result TYPE TABLE OF ty_result.

SELECT a~vbeln
       a~kunnr
       b~posnr
       b~matnr
  INTO TABLE it_result
  FROM vbak AS a
  LEFT OUTER JOIN vbap AS b
  ON a~vbeln = b~vbeln.

SELECT b~vbeln
       b~kunnr
       b~posnr
       b~matnr
  INTO TABLE it_result
  FROM vbap AS b
  LEFT OUTER JOIN vbak AS a
  ON a~vbeln = b~vbeln.

" Exibir os dados retornados
cl_demo_output=>display( it_result ).


