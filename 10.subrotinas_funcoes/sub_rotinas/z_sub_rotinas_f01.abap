FORM f_selecionar_dados.
  SELECT *
    FROM t001
    INTO TABLE t_t001
    WHERE bukrs IN s_bukrs.

  IF sy-subrc = 0. " Verifica se a seleção foi bem-sucedida
    SORT t_t001 BY land1.
  ENDIF.

ENDFORM.

FORM f_exibir_dados.
  DATA: wa_t001 TYPE t001.         " work area
  LOOP AT t_t001 INTO wa_t001.
    WRITE: wa_t001-bukrs,
           wa_t001-butxt,
           wa_t001-land1.
  ENDLOOP.
ENDFORM.