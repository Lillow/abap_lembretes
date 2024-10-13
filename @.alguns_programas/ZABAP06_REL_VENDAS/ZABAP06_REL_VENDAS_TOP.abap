*&---------------------------------------------------------------------*
*& Include          ZABAP06_REL_VENDAS_TOP
*&---------------------------------------------------------------------*
TABLES: vbak,
        prcd_elements.


TYPES: BEGIN OF ty_inner_vbak_vbap,
         vbeln     TYPE vbeln,
         auart     TYPE auart,
         posnr     TYPE posnr_va,
         matnr     TYPE matnr,
         arktx     TYPE arktx,
         kwmeng    TYPE kwmeng,
         vrkme     TYPE vrkme,
         knumv_ana TYPE knumv,
       END OF ty_inner_vbak_vbap,

       BEGIN OF ty_prcd,
         knumv TYPE knumv,
         kposn TYPE kposn,
         kawrt TYPE vfprc_element_base_value,
         kbetr TYPE vfprc_element_amount,
         waers TYPE waers,
       END OF ty_prcd,

       BEGIN OF ty_saida,
         mandt     TYPE mandt,
         vbeln     TYPE vbeln,
         posnr     TYPE posnr_va,
         auart     TYPE auart,
         matnr     TYPE matnr,
         arktx     TYPE arktx,
         kwmeng    TYPE kwmeng,
         vrkme     TYPE vrkme,
         knumv_ana TYPE knumv,
         kposn     TYPE kposn,
         kawrt     TYPE vfprc_element_base_value,
         kbetr     TYPE vfprc_element_amount,
         waers     TYPE waers,
       END OF ty_saida.

*----------------------------------------------------------------------*
* Tabelas Internas
*----------------------------------------------------------------------*
DATA: t_vbak_vbap TYPE TABLE OF ty_inner_vbak_vbap,
      t_prcd      TYPE TABLE OF ty_prcd,
      t_academia  TYPE TABLE OF zacademia99_1,
      t_saida     TYPE TABLE OF ty_saida.