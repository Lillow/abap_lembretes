*&---------------------------------------------------------------------*
*& Report ZVARIAVEIS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZVARIAVEIS.

* Variaveis, tipos primitivos.
* Texto
DATA: v_texto             TYPE string VALUE 'value é opcional',            " É usado para armazenar texto de comprimento variável.
      v_caractere10       TYPE c LENGTH 10,       " É usado para armazenar texto de comprimento fixo.
      v_caractere25       TYPE char25,            " Um sinônimo para o tipo c, usado para texto de comprimento fixo.
      v_hex               TYPE x LENGTH 5,        " Usado para armazenar dados binários em formato hexadecimal.
      v_texto_longo       TYPE text255,           " Texto longo
      V_texto_numerico    TYPE n LENGTH 5.        " É usado para armazenar apenas números como texto. O comprimento deve ser especificado.

*      v_n1     Type n length 2,
*      v_n2    type i.

*      v_n1 = 50.
*      v_n2 = '42'.
*      v_n1 += v_n2.
*      write v_n1.


*      v_texto = '1'.
*      v_texto += v_texto.
*      WRITE v_texto.
*
*      v_texto_numerico = '4'.
*      v_texto += v_texto_numerico.
*      WRITE v_texto.

************************************************************************************************************************************

* Numerico inteiro
DATA: v_inteiro           TYPE  i,                " Inteiro (4 bytes)	-2.147.483.648 a 2.147.483.647
      v_inteiro1          TYPE  int1,             " Inteiro pequeno (1 byte)  0 a 255
      v_inteiro2          TYPE  int2,             " Inteiro médio (2 bytes)	-32.768 a 32.767
      v_inteiro4          TYPE  int4,             " Inteiro longo (4 bytes)	-2.147.483.648 a 2.147.483.647
      v_inteiro8          TYPE  int8.             " Inteiro muito longo (8 bytes)	-9.223.372.036.854.775.808 a 9.223.372.036.854.775.807

*      v_inteiro = 5.
*      v_inteiro += 5.
*      v_inteiro = 5.
*      WRITE v_inteiro

************************************************************************************************************************************

* Numerico real
DATA: v_decimal           TYPE p DECIMALS 2,      " Usado para armazenar números com ponto fixo (decimais). 2 casas decimais
      v_flutuante         TYPE f.                 " Usado para armazenar números em ponto flutuante.

*      v_decimal = '2.222'.
*      WRITE v_decimal.
*
*      v_flutuante = '2.98'.
*      WRITE V_flutuante.

************************************************************************************************************************************

* Data e Hora
DATA: v_data              TYPE d,                 " Armazena datas entre 01.01.0001 e 31.12.9999.
      v_hora              TYPE t,                 " Armazena horas de 00:00:00 a 23:59:59.
      v_data_hora         TYPE timestamp.         " Usado para armazenar data e hora juntos, com precisão até microsegundos. O formato é baseado no número de segundos desde 1970-01-01 00:00:00 UTC.

v_data = '01-01-2024'.                            " Atribuindo data no formato BR
v_data = '2024-03-21'.                            " Atribuindo data no formato Americano
v_hora = '14:30:00'.                              " Atribuindo hora
v_data = sy-datum.                                " Pegando e atribuindo a data atual
v_hora = sy-uzeit.                                " Pegando e atribuindo a hora atual
v_data = v_data + 10.                             " Adiciona 10 dias

*WRITE v_data.
*WRITE v_hora.

************************************************************************************************************************************

* Booleano
DATA: v_flag TYPE abap_bool.

v_flag = abap_true.  " Atribuindo verdadeiro
lv_flag = abap_false. " Atribuindo falso