*&---------------------------------------------------------------------*
*& Include          ZABAP06_REL_VENDAS_SEL
*&---------------------------------------------------------------------*

INITIALIZATION.


*----------------------------------------------------------------------*
*                      Parâmetro da Tela de seleção
*----------------------------------------------------------------------*
  SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-t01.

    SELECT-OPTIONS: s_vbeln FOR vbak-vbeln OBLIGATORY.

    PARAMETERS: p_kschl TYPE kschl DEFAULT 'IBRX' OBLIGATORY.

  SELECTION-SCREEN END OF BLOCK a1.

*----------------------------------------------------------------------*
*                      AT SELECTION-SCREEN
*----------------------------------------------------------------------*