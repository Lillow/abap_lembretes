REPORT ZEVENTOS_EXEVUTAVEL.

DATA: lv_user_input TYPE string.

INITIALIZATION. " É executado uma única vez no início do programa, antes de qualquer tela ser exibida. Ele é usado para definir valores padrão para variáveis e realizar inicializações necessárias.
  WRITE: / 'Inicializando variáveis'.

AT SELECTION-SCREEN. " É acionado quando a tela de seleção é exibida e pode ser usado para realizar validações ou modificações antes da execução do programa. Você pode ter múltiplos eventos AT SELECTION-SCREEN para diferentes cenários.
  IF lv_user_input IS INITIAL.
    MESSAGE 'Por favor, insira um valor' TYPE 'E'.
  ENDIF.

START-OF-SELECTION. " É um dos eventos mais importantes e é executado logo após a seleção da tela. É aqui que a lógica principal do programa é geralmente implementada. Todos os dados de entrada já foram processados quando este evento é chamado.
  WRITE: / 'Processando dados principais com valor:', lv_user_input.

END-OF-SELECTION. " É executado após a conclusão do processamento no evento START-OF-SELECTION. É frequentemente usado para gerar saídas finais ou relatórios.
  WRITE: / 'Fim do processamento'.

TOP-OF-PAGE. " É utilizado em relatórios listados e é executado sempre que uma nova página é iniciada na saída. Ele é geralmente usado para imprimir cabeçalhos de página.
  WRITE: / 'Cabeçalho do Relatório'.

AT LINE-SELECTION. " é acionado quando o usuário clica em uma linha específica de um relatório. Este evento permite que você execute ações específicas para a linha selecionada.
  WRITE: / 'Você selecionou a linha:', sy-tabix.