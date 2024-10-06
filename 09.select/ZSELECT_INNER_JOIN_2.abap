REPORT ZSELECT_INNER_JOIN_2.

TABLES: vbak, kna1.

TYPES: BEGIN OF ty_vbak,
       vbeln TYPE vbeln_va,
       erdat TYPE erdat,
       erzet TYPE erzet,
       ernam TYPE ernam,
       END OF ty_vbak,

       BEGIN OF ty_vbap,
       matnr TYPE matnr,
       END OF ty_vbap,

       BEGIN OF ty_mara,
       ersda TYPE ersda,
       mtart TYPE mtart,
       END OF ty_mara,

       BEGIN OF ty_prcd_elements,
       knumv TYPE knumv,
       END OF ty_prcd_elements,

       BEGIN OF ty_kna1,
       kunnr TYPE kunnr,
       name1_gp TYPE name1_gp,
       ORT01 TYPE ORT01,
       STRAS TYPE STRAS,
       PSTLZ TYPE PSTLZ,
       REGIO TYPE REGIO,
       END OF ty_kna1,

       BEGIN OF ty_resultado,
       name1 TYPE name1_gp,
       kunnr TYPE kunnr,
       ORT01 TYPE ORT01,
       STRAS TYPE STRAS,
       PSTLZ TYPE PSTLZ, " Fim dos dados do cliente
       REGIO TYPE REGIO,
       vbeln TYPE vbeln_va,
       erdat TYPE erdat,
       erzet TYPE erzet,
       ernam TYPE ernam, " Fim dos dados de cabeçalho
       matnr TYPE matnr,
       ersda TYPE ersda,
       mtart TYPE mtart, " Fim dos dados de material/item
       knumv TYPE knumv, " Fim dos dados do produto
       END OF ty_resultado.

DATA: it_resultado TYPE TABLE OF ty_resultado.

" SELECT-OPTIONS para os filtros
SELECT-OPTIONS: s_kunnr FOR kna1-kunnr,
                s_erdat FOR vbak-erdat.

" Parâmetros removidos, pois não eram usados:
* PARAMETERS:  p_erdat TYPE vbak-erdat.

START-OF-SELECTION.

" Seleção principal dos dados
  SELECT kna~name1
         kna~kunnr   " Nº do cliente
         kna~ORT01
         kna~STRAS
         kna~PSTLZ
         kna~REGIO
         vbk~vbeln   " Remessa
         vbk~erdat   " Data de registro
         vbk~erzet   " Hora de registro
         vbk~ernam   " Nome do responsável
         vbp~matnr   " Nº do Material
         mra~ersda   " Data de criação
         mra~mtart   " Tipo de material
         pre~knumv   " Nº do produto

    INTO TABLE it_resultado
    FROM vbak AS vbk
    INNER JOIN vbap AS vbp
    ON vbk~vbeln = vbp~vbeln
    INNER JOIN mara AS mra
    ON vbp~matnr = mra~matnr
    INNER JOIN prcd_elements AS pre
    ON vbk~knumv = pre~knumv
    INNER JOIN kna1 AS kna
    ON vbk~kunnr = kna~kunnr
    WHERE kna~kunnr IN s_kunnr
      AND vbk~erdat IN s_erdat. " Filtro de data de criação

  " Verificação de retorno de dados
  IF sy-subrc = 0.
    " Opcional: Remover duplicatas, caso necessário
    DELETE ADJACENT DUPLICATES FROM it_resultado COMPARING erdat erzet vbeln.

    " Ordenar o resultado por data e hora
    SORT it_resultado BY erdat erzet vbeln.

    " Exibir resultado
    cl_demo_output=>display( it_resultado ).

  ELSE.
    WRITE: 'Nenhum dado encontrado para os critérios selecionados.'.
  ENDIF.

END-OF-SELECTION.