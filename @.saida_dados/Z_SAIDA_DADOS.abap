REPORT zsaida_dados.

" =======================================================
" Saída de Dados
" =======================================================

" Exibição de dados básicos
DATA: p_nome  TYPE string VALUE 'João',
      p_idade TYPE i VALUE 25.

WRITE: / 'Nome:', p_nome,   " Exibe o nome
       / 'Idade:', p_idade. " Exibe a idade

" =======================================================
" Saída de dados de uma tabela interna
" =======================================================

" Simulação de tabela interna de materiais
DATA: it_materiais TYPE TABLE OF mara, " Tabela interna
      wa_material  TYPE mara.          " Work area para processar cada material

" Exemplo de preenchimento de tabela interna com dados fictícios (para exemplo)
APPEND VALUE #( matnr = '0001' maktx = 'Material A' ) TO it_materiais.
APPEND VALUE #( matnr = '0002' maktx = 'Material B' ) TO it_materiais.

" Exibe os dados da tabela interna usando LOOP
LOOP AT it_materiais INTO wa_material.
  WRITE: / 'Número do Material:', wa_material-matnr,
         / 'Descrição:', wa_material-maktx.
ENDLOOP.

" =======================================================
" Saída Avançada - ALV Grid
" =======================================================

" Exemplo de exibição de tabela interna usando ALV
DATA: o_alv       TYPE REF TO cl_gui_alv_grid,   " Objeto ALV
      it_fieldcat TYPE lvc_t_fcat,               " Catálogo de campos
      it_data     TYPE TABLE OF mara.            " Dados a serem exibidos

" Preenchendo a tabela interna para o ALV (com dados fictícios)
APPEND LINES OF it_materiais TO it_data.

" Configuração do campo de catálogo para ALV (ajustar conforme necessidade)
" Exemplificando com uma estrutura simples

CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name = 'MARA'    " Usando a estrutura de tabela MARA
  CHANGING
    ct_fieldcat      = it_fieldcat.

" Criação e exibição do ALV
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid   " Programa atual
  TABLES
    t_outtab          = it_data     " Dados a serem exibidos
    t_fieldcat        = it_fieldcat. " Catálogo de campos
