*&---------------------------------------------------------------------*
*& Report Z_VARIAVEIS - Demonstração de Declaração de Dados em ABAP
*&---------------------------------------------------------------------*

REPORT Z_VARIAVEIS.

" =======================================================
" Exemplo de Declaração de Tipos Primitivos de Texto
" =======================================================
* Variáveis de Texto e Caracteres
DATA: v_texto             TYPE string VALUE 'Texto de exemplo',          " Texto de comprimento variável
      v_caractere10       TYPE c LENGTH 10,                              " Texto de comprimento fixo (10 caracteres)
      v_caractere25       TYPE char25,                                   " Outro exemplo de texto de comprimento fixo (25 caracteres)
      v_hex               TYPE x LENGTH 5,                               " Dados binários em formato hexadecimal
      v_texto_longo       TYPE text255,                                  " Texto longo (até 255 caracteres)
      v_texto_numerico    TYPE n LENGTH 5.                               " Texto para números (ex: '12345')

" =======================================================
" Exemplo de Operações com Textos
" =======================================================
*      v_texto = 'AB'.
*      v_texto += 'CD'.         " Resultado esperado: ABCD
*      WRITE: / 'Texto Concatenado:', v_texto.
      
*      v_texto_numerico = '5'.
*      v_texto += v_texto_numerico.  " Resultado esperado: Texto concatenado com número (ex: ABCD5)
*      WRITE: / 'Texto + Número:', v_texto.

" =======================================================
" Exemplo de Declaração de Tipos Numéricos Inteiros
" =======================================================
DATA: v_inteiro           TYPE i,                 " Inteiro padrão (4 bytes)
      v_inteiro1          TYPE int1,              " Inteiro pequeno (1 byte)
      v_inteiro2          TYPE int2,              " Inteiro médio (2 bytes)
      v_inteiro4          TYPE int4,              " Inteiro longo (4 bytes)
      v_inteiro8          TYPE int8.              " Inteiro muito longo (8 bytes)

*      v_inteiro = 100.
*      v_inteiro += 50.         " Resultado esperado: 150
*      WRITE: / 'Valor do inteiro:', v_inteiro.

" =======================================================
" Exemplo de Tipos Numéricos com Decimais e Flutuantes
" =======================================================
DATA: v_decimal           TYPE p DECIMALS 2,      " Números com 2 casas decimais (ex: 123.45)
      v_flutuante         TYPE f.                 " Números de ponto flutuante

*      v_decimal = '10.55'.      " Atribuindo valor decimal
*      WRITE: / 'Número decimal:', v_decimal.

*      v_flutuante = '3.14'.     " Atribuindo valor flutuante
*      WRITE: / 'Número flutuante:', v_flutuante.

" =======================================================
" Exemplo de Tipos de Data e Hora
" =======================================================
DATA: v_data              TYPE d,                 " Tipo para armazenar data (AAAAMMDD)
      v_hora              TYPE t,                 " Tipo para armazenar hora (HHMMSS)
      v_data_hora         TYPE timestamp.         " Tipo timestamp (data e hora juntos)

* Atribuição de data no formato AAAAMMDD
v_data = '20240321'.                               " Data: 21 de março de 2024
v_hora = '143000'.                                 " Hora: 14:30:00
v_data = sy-datum.                                 " Atribuindo a data atual do sistema
v_hora = sy-uzeit.                                 " Atribuindo a hora atual do sistema

* Manipulação de data
v_data = v_data + 10.                              " Adiciona 10 dias à data atual

*WRITE: / 'Data atual + 10 dias:', v_data.
*WRITE: / 'Hora atual:', v_hora.

" =======================================================
" Exemplo de Variável Booleana
" =======================================================
DATA: v_flag TYPE abap_bool.                      " Tipo booleano (abap_true, abap_false)

v_flag = abap_true.                               " Atribui verdadeiro
*WRITE: / 'Valor booleano (true):', v_flag.

v_flag = abap_false.                              " Atribui falso
*WRITE: / 'Valor booleano (false):', v_flag.
