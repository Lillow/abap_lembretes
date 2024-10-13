*&---------------------------------------------------------------------*
*& Report ZABAP06_VBFA_TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap06_vbfa_tab.

INCLUDE: ZABAP06_VBFA_TAB_top,
         ZABAP06_VBFA_TAB_sel,
         ZABAP06_VBFA_TAB_f01.


START-OF-SELECTION.

  PERFORM f_chamar_funcao.

END-OF-SELECTION.