*&---------------------------------------------------------------------*
*& Report Z_WORK_AREA_TABELA_INTERNA
*& Declaração e Manipulação de Dados
*&---------------------------------------------------------------------*

REPORT z06_decl_manip_dados.

" =======================================================
" Exemplo de Declaração e Uso de Work Area
" =======================================================

DATA: wa_vbak TYPE vbak. " Declaração da work area para a tabela VBAK

" Seleção de um único registro da tabela VBAK
SELECT SINGLE * 
  FROM vbak 
  INTO wa_vbak 
  WHERE vbeln = '0000000004'.    " Filtra pelo número do documento

" Exibe os dados do registro selecionado
WRITE: / 'Número do Documento: ', wa_vbak-vbeln,
       / 'Data do Documento: ', wa_vbak-erdat,
       / 'Tipo do Documento de Vendas: ', wa_vbak-auart.

*************************************************************************************************************************************

" =======================================================
" Exemplo de Declaração e Manipulação de Tabela Interna
" =======================================================

DATA: it_vbak TYPE TABLE OF vbak,   " Declaração da tabela interna para armazenar registros de VBAK
      wa_vbak_2 TYPE vbak.          " Work area para processar cada registro de VBAK

" Seleção de todos os registros da tabela VBAK com data >= 01/01/2024
SELECT * 
  FROM vbak 
  INTO TABLE it_vbak 
  WHERE erdat >= '20240101'.

" Exibe o número de registros selecionados
DATA(lv_count) = lines( it_vbak ).
WRITE: / 'Número de Documentos Selecionados:', lv_count.

" Processamento de cada registro da tabela interna
LOOP AT it_vbak INTO wa_vbak_2.
  WRITE: / 'Número do Documento:', wa_vbak_2-vbeln,
         / 'Data do Documento:', wa_vbak_2-erdat,
         / 'Cliente:', wa_vbak_2-kunnr.
ENDLOOP.

*************************************************************************************************************************************

" =======================================================
" Manipulação de Tabelas Internas: Inserção, Alteração e Exclusão
" =======================================================

" Declaração de tabela interna e work area para clientes
DATA: it_customers TYPE TABLE OF kna1,   " Tabela interna para armazenar registros de KNA1 (clientes)
      wa_customer TYPE kna1.             " Work area para processar registros de clientes

" Preenche a work area com dados de exemplo
wa_customer-kunnr = '123456'.
wa_customer-name1 = 'Cliente Exemplo'.

" Insere a work area na tabela interna
APPEND wa_customer TO it_customers.

" =======================================================
" Alteração de Registros na Tabela Interna
" =======================================================
LOOP AT it_customers INTO wa_customer WHERE kunnr = '123456'.
  wa_customer-name1 = 'Cliente Alterado'.    " Altera o nome do cliente
  MODIFY it_customers FROM wa_customer.      " Modifica o registro na tabela interna
ENDLOOP.

" =======================================================
" Remoção de Registros da Tabela Interna
" =======================================================
DELETE it_customers WHERE kunnr = '123456'.   " Remove o registro com base no número do cliente

*************************************************************************************************************************************
