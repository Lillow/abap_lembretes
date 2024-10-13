*&---------------------------------------------------------------------*
*& Report Z_EXEMPLO_LOGICA
*&---------------------------------------------------------------------*
*& Exemplo de Lógica de Negócio em ABAP
*&---------------------------------------------------------------------*

REPORT Z_EXEMPLO_LOGICA.

* Declaração de tabelas internas e estruturas
DATA: t_vendas   TYPE TABLE OF ty_venda,   " Tabela interna para vendas
      t_resultado TYPE TABLE OF ty_resultado, " Tabela interna para resultados
      wa_venda    TYPE ty_venda,   " Work area para vendas
      wa_resultado TYPE ty_resultado. " Work area para resultado

* Eventos
START-OF-SELECTION.
  PERFORM f_selecionar_vendas.   " Seleciona vendas

  LOOP AT t_vendas INTO wa_venda. " Loop através das vendas
    PERFORM f_processar_venda USING wa_venda CHANGING wa_resultado. " Processa cada venda

    APPEND wa_resultado TO t_resultado. " Adiciona resultado à tabela de resultados
  ENDLOOP.

  PERFORM f_exibir_resultados.  " Exibe os resultados

*&---------------------------------------------------------------------*
*& Form f_selecionar_vendas
*&---------------------------------------------------------------------*
FORM f_selecionar_vendas.
  " Simulação de seleção de vendas (normalmente seria um SELECT no banco de dados)
  wa_venda-id = '001'.
  wa_venda-valor = 100.
  wa_venda-status = 'PENDENTE'.
  APPEND wa_venda TO t_vendas.

  wa_venda-id = '002'.
  wa_venda-valor = 200.
  wa_venda-status = 'APROVADO'.
  APPEND wa_venda TO t_vendas.

  wa_venda-id = '003'.
  wa_venda-valor = 150.
  wa_venda-status = 'REJEITADO'.
  APPEND wa_venda TO t_vendas.

  wa_venda-id = '004'.
  wa_venda-valor = 300.
  wa_venda-status = 'PENDENTE'.
  APPEND wa_venda TO t_vendas.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form f_processar_venda
*&---------------------------------------------------------------------*
FORM f_processar_venda USING p_venda TYPE ty_venda
                              CHANGING p_resultado TYPE ty_resultado.
  " Processa a venda de acordo com seu status
  IF p_venda-status = 'APROVADO'.
    p_resultado-id = p_venda-id.
    p_resultado-valor = p_venda-valor * 0.9. " Aplicando desconto de 10%
    p_resultado-mensagem = 'Venda aprovada com desconto.'.
  ELSEIF p_venda-status = 'PENDENTE'.
    p_resultado-id = p_venda-id.
    p_resultado-valor = p_venda-valor. 
    p_resultado-mensagem = 'Venda pendente. Aguardando aprovação.'.
  ELSE.
    p_resultado-id = p_venda-id.
    p_resultado-valor = 0.
    p_resultado-mensagem = 'Venda rejeitada.'.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form f_exibir_resultados
*&---------------------------------------------------------------------*
FORM f_exibir_resultados.
  LOOP AT t_resultado INTO wa_resultado.
    WRITE: / 'ID da Venda:', wa_resultado-id,
           'Valor Final:', wa_resultado-valor,
           'Mensagem:', wa_resultado-mensagem.
  ENDLOOP.
ENDFORM.

* Definições de tipos para vendas e resultados
TYPES: BEGIN OF ty_venda,
         id TYPE string,
         valor TYPE i,
         status TYPE string,
       END OF ty_venda.

TYPES: BEGIN OF ty_resultado,
         id TYPE string,
         valor TYPE i,
         mensagem TYPE string,
       END OF ty_resultado.
