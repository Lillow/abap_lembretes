REPORT SELECT_JOIN_LEFT_OUTER_JOIN.

DATA: it_result TYPE TABLE OF ty_result.

SELECT a~vbeln
       a~kunnr
       b~posnr
       b~matnr
  INTO TABLE it_result
  FROM vbak AS a
  LEFT OUTER JOIN vbap AS b
  ON a~vbeln = b~vbeln
  WHERE a~erdat BETWEEN '20230101' AND '20231231'.

" Exibir os dados retornados
cl_demo_output=>display( it_result ).
