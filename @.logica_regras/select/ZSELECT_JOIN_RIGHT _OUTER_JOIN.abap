REPORT SELECT_JOIN_RIGHT_OUTER_JOIN.

DATA: it_result TYPE TABLE OF ty_result.

SELECT a~vbeln
       a~kunnr
       b~posnr
       b~matnr
  INTO TABLE it_result
  FROM vbak AS a
  RIGHT OUTER JOIN vbap AS b
  ON a~vbeln = b~vbeln
  WHERE b~matnr LIKE 'A%'.

" Exibir os dados retornados
cl_demo_output=>display( it_result ).

