* TOP
* Definição de variáveis globais
DATA: gv_texto TYPE string,
      gv_split1 TYPE string,
      gv_split2 TYPE string,
      gv_num1 TYPE i VALUE 10,
      gv_num2 TYPE i VALUE 5,
      gv_result TYPE i.

* Parâmetros da tela de seleção
PARAMETERS: p_num1 TYPE i DEFAULT 10,
            p_num2 TYPE i DEFAULT 5.

* Botões de rádio e checkbox na seleção
PARAMETERS: r_add RADIOBUTTON GROUP g1 DEFAULT 'X',
            r_sub RADIOBUTTON GROUP g1,
            chk_double AS CHECKBOX.
