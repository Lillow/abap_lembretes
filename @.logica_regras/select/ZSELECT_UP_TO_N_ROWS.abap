REPORT ZSELECT_UP_TO_N_ROWS.

" O UP TO n ROWS permite que você busque até um número específico de linhas, 
" em vez de apenas uma.

" Parameter de filtro por documento
PARAMETERS  p_doc_c TYPE belnr_d.

" Criação de tipo/estrutura/modelo
TYPES: BEGIN OF ty_bkpf,
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         blart TYPE blart,
         bldat TYPE bldat,
         budat TYPE budat,
       END OF ty_bkpf.

" Definição de variáveis
DATA: ti_bkpf TYPE TABLE OF ty_bkpf,
      wa_bkpf TYPE ty_bkpf,
      v_limit TYPE i VALUE 5. " Variável de controle de registros retornados

" Select exemplo
SELECT bukrs
       belnr
       gjahr
       blart
       bldat
       budat
FROM   bkpf UP TO v_limit ROWS
WHERE  belnr = p_doc_c
INTO TABLE ti_bkpf.

" Checagem de sucesso na consulta
IF sy-subrc = 0.
  READ TABLE ti_bkpf INTO wa_bkpf INDEX 1.
  WRITE: / wa_bkpf-bukrs.

ENDIF.