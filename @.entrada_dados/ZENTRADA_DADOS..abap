REPORT ZENTRADA_SAIDA_DADOS.

" =======================================================
" Entrada de Dados
" =======================================================


" =======================================================
" PARAMETERS
" =======================================================
" Entrada de texto e número inteiro
PARAMETERS: p_nome  TYPE string, " Entrada de texto (nome)
            p_idade TYPE i.      " Entrada de número inteiro (idade)

" Botões de Rádio para operações (exemplo de uso de radio buttons)
PARAMETERS: p_adi   RADIOBUTTON GROUP g1, " Botão de rádio 1
            p_sub   RADIOBUTTON GROUP g1, " Botão de rádio 2
            p_mult  RADIOBUTTON GROUP g1, " Botão de rádio 3
            p_div   RADIOBUTTON GROUP g1. " Botão de rádio 4

" Caixa de seleção (Checkbox)
PARAMETERS: p_check1 TYPE abap_bool AS CHECKBOX, " Checkbox 1
            p_check2 TYPE abap_bool AS CHECKBOX. " Checkbox 2

" =======================================================
" SELECT-OPTIONS
" =======================================================

" Seleção de intervalo para materiais (exemplo de uso de SELECT-OPTIONS)
DATA: mara_matnr TYPE mara-matnr VALUE '10'. " Exemplo de número de material
SELECT-OPTIONS: so_nome FOR mara_matnr. " Intervalo de números de material

START-OF-SELECTION.

* Exibe os valores inseridos (opcional)
WRITE: / 'Nome:', p_nome,
       / 'Idade:', p_idade.

* Exibe o status dos checkboxes e botões de rádio (opcional)
IF p_adi = 'X'.
  WRITE: / 'Operação selecionada: Adição'.
ELSEIF p_sub = 'X'.
  WRITE: / 'Operação selecionada: Subtração'.
ELSEIF p_mult = 'X'.
  WRITE: / 'Operação selecionada: Multiplicação'.
ELSEIF p_div = 'X'.
  WRITE: / 'Operação selecionada: Divisão'.
ENDIF.

IF p_check1 = abap_true.
  WRITE: / 'Checkbox 1 está marcado.'.
ENDIF.

IF p_check2 = abap_true.
  WRITE: / 'Checkbox 2 está marcado.'.
ENDIF.

" Exibe o intervalo selecionado (opcional)
WRITE: / 'Material selecionado:', so_nome.
