*&---------------------------------------------------------------------*
*& Report ZABAP06_ALV_OO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaraujo_alv_oo MESSAGE-ID ZAJUNIOR.


INCLUDE ZARAUJO_ALV_OO_TOP.
*INCLUDE: ZADEMIR_ALV_OO_top,  "Declaração Global de dados
INCLUDE ZARAUJO_ALV_OO_SEL.
*         ZADEMIR_ALV_OO_sel,  "Tela de Seleção
INCLUDE ZARAUJO_ALV_OO_F01.
*         ZADEMIR_ALV_OO_f01.  "Subrotinas

START-OF-SELECTION.

  PERFORM f_main.    " Fluxo principal

END-OF-SELECTION.