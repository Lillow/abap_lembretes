REPORT z_sub_rotinas.

INCLUDE:  z_sub_rotinas_top,
          z_sub_rotinas_sel,
          z_sub_rotinas_f01.
*         z_sub_rotinas_f02. " Alternative flow



*DATA: t_t001  TYPE TABLE OF t001, " Tabela interna
*      wa_t001 TYPE t001.         " Estrutura de trabalho para loop

*SELECT-OPTIONS: s_bukrs FOR t001-bukrs OBLIGATORY.

START-OF-SELECTION.

  PERFORM f_selecionar_dados.



END-OF-SELECTION.

  IF t_t001 IS INITIAL.
    WRITE 'Não existem dados'.
    EXIT. " Saída do programa
  ENDIF.

  PERFORM f_exibir_dados.