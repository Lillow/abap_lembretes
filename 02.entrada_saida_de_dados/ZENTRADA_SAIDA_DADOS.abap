REPORT ZENTRADA_SAIDA_DADOS.


* Entrada de dados

PARAMETERS: p_nome  TYPE string, " Usados para entrada de dados em relatórios. Permitem que o usuário insira dados durante a execução do programa.
            p_idade TYPE i.

PARAMETERS:   p_adi   RADIOBUTTON GROUP g1, " Tornar o parameters um radio button
              p_sub   RADIOBUTTON GROUP g1,
              p_mult  RADIOBUTTON GROUP g1,
              p_div   RADIOBUTTON GROUP g1.

PARAMETERS: p_check1 TYPE abap_bool AS CHECKBOX, " Tornar o parameters um checkbox
            p_check2 TYPE abap_bool AS CHECKBOX.

Data mara_matnr type i value 10.
SELECT-OPTIONS: so_nome FOR mara_matnr. " Uma maneira de definir campos de entrada que aparecem em uma tela.

*DATA: it_materiais TYPE TABLE OF mara,
*      wa_material TYPE mara.
*
*SELECT * FROM mara INTO TABLE it_materiais WHERE matnr IN so_nome. " Usado para ler dados de tabelas internas.

************************************************************************************************************************************

* Saída de dados

WRITE: / 'Nome:', p_nome, " Para imprimir dados na tela
       / 'Idade:', p_idade.

*LOOP AT it_materiais INTO wa_material.
*  WRITE: / wa_material-matnr, wa_material-maktx. " Usar en laços para imprimir tabelas internas.
*ENDLOOP.

* Um método avançado e flexível para exibir dados. (Ainda não saquei)

*DATA: o_alv TYPE REF TO cl_gui_alv_grid,
*      it_fieldcat TYPE lvc_t_fcat,
*      it_data TYPE TABLE OF mara.
*
*" Configurar o campo de catálogo
*" Código para criar ALV
*
*o_alv->set_table_for_first_display(
*  EXPORTING
*    i_structure_name = 'MARA'
*  CHANGING
*    it_outtab      = it_data
*    it_fieldcatalog = it_fieldcat ).