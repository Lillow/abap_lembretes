*&---------------------------------------------------------------------*
*& Report ZABAP06_REL_VENDAS
*&---------------------------------------------------------------------*
*& Relatório de vendas com a utilização das tabelas VBAK, VBAP
*&---------------------------------------------------------------------*
REPORT zabap06_rel_vendas MESSAGE-ID zabap06.

INCLUDE: zabap06_rel_vendas_top,  "Declaração Global de dados
         zabap06_rel_vendas_sel,  "Tela de Seleção e eventos de tela
         zabap06_rel_vendas_F01.  "Subrotinas

START-OF-SELECTION.

  PERFORM f_selecionar_dados.

  PERFORM f_manipular_dados.

  IF t_saida IS INITIAL.
    MESSAGE e000.
  ELSE.
    PERFORM f_gravar_dados_tabela.

    PERFORM f_saida.
  ENDIF.

END-OF-SELECTION.