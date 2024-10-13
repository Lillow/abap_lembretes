SE 11
SE 16

*****************************************************************************************************************************************************
Exemplo de Criação de Work Area

TYPES: BEGIN OF ty_mara,
         matnr TYPE matnr,   " Código do material
         maktx TYPE maktx,   " Descrição do material
         mtart TYPE mtart,   " Tipo de material
       END OF ty_mara.

DATA: wa_mara TYPE ty_mara.  " Criação da Work Area

" Atribuindo valores à Work Area
wa_mara-matnr = '000000000000001234'.
wa_mara-maktx = 'Produto Exemplo'.
wa_mara-mtart = 'FERT'.

" Exibindo os valores da Work Area
WRITE: / 'Material:', wa_mara-matnr,
       / 'Descrição:', wa_mara-maktx,
       / 'Tipo:', wa_mara-mtart.

*****************************************************************************************************************************************************
Exemplo de Criação de Tabela Interna

TYPES: BEGIN OF ty_mara,
         matnr TYPE matnr,   " Código do material
         maktx TYPE maktx,   " Descrição do material
         mtart TYPE mtart,   " Tipo de material
       END OF ty_mara.

DATA: it_mara TYPE TABLE OF ty_mara,  " Criação da Tabela Interna
      wa_mara TYPE ty_mara.           " Criação da Work Area

" Preenchendo a Work Area com valores e inserindo na tabela interna
wa_mara-matnr = '000000000000001234'.
wa_mara-maktx = 'Produto A'.
wa_mara-mtart = 'FERT'.
APPEND wa_mara TO it_mara.  " Adiciona o registro à tabela interna

wa_mara-matnr = '000000000000001235'.
wa_mara-maktx = 'Produto B'.
wa_mara-mtart = 'ROH'.
APPEND wa_mara TO it_mara.  " Adiciona o registro à tabela interna

" Exibindo os registros da tabela interna
LOOP AT it_mara INTO wa_mara.
  WRITE: / 'Material:', wa_mara-matnr,
         / 'Descrição:', wa_mara-maktx,
         / 'Tipo:', wa_mara-mtart.
ENDLOOP.

*****************************************************************************************************************************************************
Definindo Tabelas Internas Ordenadas ou Não

TYPES: BEGIN OF ty_mara,
         matnr TYPE matnr,
         maktx TYPE maktx,
       END OF ty_mara.

" Definindo uma tabela interna não ordenada (padrão)
DATA: it_mara TYPE STANDARD TABLE OF ty_mara WITH EMPTY KEY.

" Definindo uma tabela interna ordenada por matnr
DATA: it_mara_sorted TYPE SORTED TABLE OF ty_mara WITH UNIQUE KEY matnr.

" Definindo uma hash table (melhor para grandes volumes de dados com chaves únicas)
DATA: it_mara_hashed TYPE HASHED TABLE OF ty_mara WITH UNIQUE KEY matnr.

*****************************************************************************************************************************************************

SELECT 	coluna1 
		coluna2
FROM	tabela
WHERE	clausula.
ENDSELECT.

IF SY-SUBRC NE 0.
	WRITE 'Não hádados na tabela.'
ENDIF.

****************************************************************************************************************************************************

SELECT SINGLE 	coluna1		" Deverá ser usado apenas quando se tem todas as chaves para retornar o registro
				coluna2
INTO 			objeto1
				objeto2
FROM 			tabela
WHERE 			cluna3 = "1".

" Exibe o resultado
IF sy-subrc = 0.
  WRITE: / 'Material:', objeto1, objeto2.
ELSE.
  WRITE: / 'Material não encontrado'.
ENDIF.

****************************************************************************************************************************************************

" Executa o SELECT para buscar até 5 registros da tabela MARA
SELECT 	coluna1
		coluna2
FROM 	tabela UP TO 5 ROWS
INTO TABLE ti_tabela
WHERE coluna3 LIKE '00000000000000%'.  " Condição de busca (opcional)

IF sy-subrc = 0.
  " Loop para processar os registros encontrados
  LOOP AT ti_tabela INTO wa_workarea.
    WRITE: / 'Material:', wa_mara-matnr, 'Descrição:', wa_mara-maktx.
  ENDLOOP.
ELSE.
  WRITE: / 'Nenhum material encontrado.'.
ENDIF.
