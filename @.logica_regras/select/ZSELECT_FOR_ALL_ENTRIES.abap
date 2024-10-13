REPORT ZSELECT_FOR_ALL_ENTRIES.

INCLUDE ZABAP06_TOP. " Include das work áreas e tabelas internas

TABLES: likp.

" Select options de filtro
SELECT-OPTIONS s_vbeln FOR likp-vbeln OBLIGATORY.

START-OF-SELECTION.

" Seleção principal
  SELECT vbeln
         ernam
         erzet
         erdat
         vstel
         vkorg
         lfart
     FROM likp
     INTO TABLE ti_likp
    WHERE vbeln IN s_vbeln.
  
  IF sy-subrc = 0. " Verifica se o SELECT retornou dados corretamente

    IF ti_likp IS NOT INITIAL. " Verifica se ti_likp não está vazia
      SELECT vbeln
             posnr
             pstyv
             matnr
             lfimg
             meins
         FROM lips
         INTO TABLE ti_lips
         FOR ALL ENTRIES IN ti_likp
        WHERE vbeln = ti_likp-vbeln.
        
      IF sy-subrc = 0. " Verifica se o segundo SELECT foi bem-sucedido

        " Ordena a tabela de itens
        SORT ti_lips BY vbeln.

        LOOP AT ti_likp INTO wa_likp.
          wa_result_lip-vbeln = wa_likp-vbeln.
          wa_result_lip-ernam = wa_likp-ernam.
          wa_result_lip-erzet = wa_likp-erzet.
          wa_result_lip-erdat = wa_likp-erdat.
          wa_result_lip-vstel = wa_likp-vstel.
          wa_result_lip-vkorg = wa_likp-vkorg.
          wa_result_lip-lfart = wa_likp-lfart.

          " Leitura da tabela interna de itens(loop binário)
          READ TABLE ti_lips WITH KEY vbeln = wa_likp-vbeln
                            BINARY SEARCH.
          IF sy-subrc = 0. " Checagem de sucesso da leitura

            LOOP AT ti_lips INTO wa_lips FROM sy-tabix.
              IF wa_lips-vbeln NE wa_likp-vbeln.
                EXIT.
              ENDIF.
              wa_result_lip-posnr = wa_lips-posnr.
              wa_result_lip-pstyv = wa_lips-pstyv.
              wa_result_lip-matnr = wa_lips-matnr.
              wa_result_lip-lfimg = wa_lips-lfimg.
              wa_result_lip-meins = wa_lips-meins.

              APPEND wa_result_lip TO ti_result_lip.
              CLEAR wa_result_lip. " Limpeza completa da work area
            ENDLOOP.

          ENDIF.

        ENDLOOP.

      ENDIF.

    ENDIF.

  ENDIF.

END-OF-SELECTION.

" Ordena o resultado final
  SORT ti_result_lip BY vbeln posnr.

 " Lembrar sempre de ordenar a tabela interna antes

" Exibe o resultado
  cl_demo_output=>display( ti_result_lip ).
