TYPES: BEGIN OF ty_LIKP, " Documento SD: fornecimento: dados de cabeçalho
         vbeln TYPE   VBELN_vl, " Remessa (chave)
         ernam TYPE   ernam,    " Nome do resp que criou o objeto
         erzet TYPE   erzet,    " Hora Registro
         erdat TYPE   erdat,    " Data da criação do registro
         lfart TYPE   lfart,    " Tipo de remessa
       END OF ty_LIKP,

       BEGIN OF ty_LIPS, " Documento SD: fornecimento: dados de item
         vbeln TYPE VBELN_vl, " Remessa (chave)
         posnr TYPE posnr_vl, " Iten de renessa
         pstyv TYPE pstyv_vl, " Ctg.item de remessa
       END OF ty_LIPS,

       BEGIN OF ty_vbak,
         doc_vendas    TYPE  vbeln_va,
         dat_criacao   TYPE erdat,
         hora_registro TYPE erzet,
         nome_resp     TYPE ernam,
       END OF ty_vbak,

       BEGIN OF ty_bkpf,
         bukars TYPE bukrs,
         belnr  TYPE belnr_d,
         gjahr  TYPE gjahr,
         blart  TYPE blart,
         bldat  TYPE bldat,
         budat  TYPE budat,
       END OF ty_bkpf.





DATA: wa_LIKP TYPE ty_LIKP, " Criação de Work area
      ti_LIKP TYPE TABLE OF ty_LIKP, " Criação de tabela interna

      wa_LIPS TYPE ty_LIPS, " Criação de Work area
      ti_LIPS TYPE TABLE OF ty_LIPS, " Criação de tabela interna

      wa_vbak TYPE ty_vbak, " Criação de Work area
      ti_vbak TYPE TABLE OF ty_vbak, " Criação de tabela interna

      wa_bkpf TYPE ty_bkpf,
      ti_bkpf TYPE TABLE OF ty_bkpf.