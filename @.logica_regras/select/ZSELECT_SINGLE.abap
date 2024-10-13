REPORT ZSELECT_SINGLE

" O SELECT SINGLE é usado para buscar uma única linha de uma tabela do banco de dados. 
" Se houver mais de uma linha que satisfaça a condição, apenas a primeira será retornada.

" Parameter de filtro por documento
PARAMETERS doc_vend TYPE vbeln_va DEFAULT '0084000071'.


" Criação de tipo/estrutura/modelo
TYPES: BEGIN OF ty_vbak,
         doc_vendas    TYPE  vbeln_va,
         dat_criacao   TYPE erdat,
         hora_registro TYPE erzet,
         nome_resp     TYPE ernam,
       END OF ty_vbak.

DATA wa_vbak TYPE ty_vbak. " work area

" Select single exemplo
SELECT SINGLE vbeln
              erdat
              erzet
              ernam
FROM vbak
INTO wa_vbak
WHERE vbeln = doc_vend.
*WHERE vbeln = '0084000071'.

" Checagem de sucesso na consulta
IF sy-subrc = 0.
  WRITE: / wa_vbak-doc_vendas,
         / wa_vbak-dat_criacao,
         / wa_vbak-hora_registro,
         / wa_vbak-nome_resp.
ENDIF.

****************************************************************************

PARAMETERS: p_empre TYPE bukrs,
            p_doc_c TYPE belnr_d,
            p_exerc TYPE gjahr.


" Criação de tipo/estrutura/modelo
TYPES: BEGIN OF ty_bkpf,
         bukars TYPE bukrs,
         belnr  TYPE belnr_d,
         gjahr  TYPE gjahr,
         blart  TYPE blart,
         bldat  TYPE bldat,
         budat  TYPE budat,
       END OF ty_bkpf.

DATA: wa_bkpf TYPE ty_bkpf.

" Select single exemplo
SELECT SINGLE bukrs
              belnr
              gjahr
              blart
              bldat
              budat
FROM          bkpf
INTO          wa_bkpf
WHERE         bukrs =   p_empre
AND           belnr  =  p_doc_c
AND           gjahr  =  p_exerc.

" Checagem de sucesso na consulta
IF sy-subrc = 0.
  WRITE: wa_bkpf-bukars,
         wa_bkpf-belnr,
         wa_bkpf-gjahr,
         wa_bkpf-blart,
         wa_bkpf-bldat,
         wa_bkpf-budat.
ENDIF.