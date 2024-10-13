*&---------------------------------------------------------------------*
*& Report ZRELATORIO
*&---------------------------------------------------------------------*

START-OF-SELECTION.
  * Cabeçalho do Relatório
  WRITE: / 'Relatório de Exemplo' COLOR COL_HEADING,
         / 'Operações Aritméticas e Controle de Fluxo'.

  * Operações aritméticas com IF, ELSEIF, ELSE
  IF r_add = 'X'.
    gv_result = p_num1 + p_num2.
  ELSEIF r_sub = 'X'.
    gv_result = p_num1 - p_num2.
  ELSE.
    gv_result = 0.
  ENDIF.

  * Exibição do resultado da operação
  WRITE: / 'Resultado:', gv_result.

  * Operação CASE com WRITE
  CASE gv_result.
    WHEN 0.
      WRITE: / 'Nenhuma operação foi selecionada!'.
    WHEN 5.
      WRITE: / 'O resultado é 5!'.
    WHEN OTHERS.
      WRITE: / 'O resultado é diferente de 5!'.
  ENDCASE.

  * Manipulação de strings com CONCATENATE e SPLIT
  CONCATENATE 'Resultado da operação:' gv_result INTO gv_texto SEPARATED BY space.
  WRITE: / gv_texto.

  SPLIT gv_texto AT ':' INTO gv_split1 gv_split2.
  WRITE: / 'Texto dividido:', gv_split1, gv_split2.

END-OF-SELECTION.
  * Finaliza o relatório
  WRITE: / 'Fim do relatório.' COLOR COL_GROUP KEY.

* Cabeçalho de página
TOP-OF-PAGE.
  WRITE: / 'Relatório Exemplo - Cabeçalho'.

* Seleção de linha
AT LINE-SELECTION.
  WRITE: / 'Linha selecionada: ', sy-lisel.
