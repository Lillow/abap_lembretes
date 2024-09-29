REPORT zsplitar_concatenar_textos.

* Splitar textos

DATA: v_string TYPE string VALUE 'a,b,c',
      v_part1  TYPE string,
      v_part2  TYPE string,
      v_part3  TYPE string.

SPLIT v_string AT ',' INTO v_part1 v_part2 v_part3. " Splitar uma string em caracteres separados por vírgula.

************************************************************************************************************************************

* Concatenar textos

DATA: v_string1 TYPE string VALUE 'Olá',
      v_string2 TYPE string VALUE 'Mundo',
      v_result  TYPE string.

CONCATENATE v_string1 v_string2 INTO v_result SEPARATED BY space. " Concatena as strings em uma string.

************************************************************************************************************************************

* String template

DATA: v_nome     TYPE string VALUE 'Alice',
      v_greeting TYPE string.

v_greeting = |Olá, { v_nome }!|. " String template é feito assim no ABAP

************************************************************************************************************************************

* Exemplo usando Split, Concatenar e Template

DATA: v_string_1 TYPE string VALUE 'um;dois;tres',
      v_part_1   TYPE string,
      v_part_2   TYPE string,
      v_part_3   TYPE string,
      v_result_1 TYPE string.


SPLIT v_string AT ';' INTO v_part1 v_part2 v_part3. " Splitando a string

CONCATENATE v_part1 v_part2 v_part3 INTO v_result SEPARATED BY space. " Concatenando as partes com um espaço

v_result = |Resultado final:, { v_result }|.

WRITE:  v_result. " Exibindo o resultado