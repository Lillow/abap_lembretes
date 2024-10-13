*&---------------------------------------------------------------------*
*& Include Z_TOP
*&---------------------------------------------------------------------*
*& Declaração de Estrutura, Work Area e Tabela Interna para Materiais
*&---------------------------------------------------------------------*

" =======================================================
" Declaração de Estrutura para Materiais
" =======================================================
TYPES: BEGIN OF ti_materiais,
         matnr   TYPE matnr,    " Número do material
         mtart   TYPE mtart,    " Tipo de material (P, E, S)
         ersda   TYPE ersda,    " Data de criação do material
         wersks  TYPE werks_d,  " Planta
         mktx_pt TYPE maktx,    " Descrição do material em português
         mktx_en TYPE maktx,    " Descrição do material em inglês
         mktx_es TYPE maktx,    " Descrição do material em espanhol
       END OF ti_materiais.

" =======================================================
" Declaração de Tabela Interna baseada na Estrutura de Materiais
" =======================================================
TYPES: tt_materiais TYPE TABLE OF ti_materiais.  " Tabela interna para armazenar registros de materiais

" =======================================================
" Declaração de Variáveis: Tabela Interna e Work Area
" =======================================================
DATA: it_materiais TYPE tt_materiais,  " Tabela interna de materiais
      wa_materiais TYPE ti_materiais.  " Work area para processamento de cada registro de materiais
