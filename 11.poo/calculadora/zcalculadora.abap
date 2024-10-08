REPORT zcalculadora.

INCLUDE: zcalculadora_top,
         zcalculadora_sel.

INITIALIZATION.
  DATA(mo_calculadora) = NEW zabap06( ).


START-OF-SELECTION.

  CASE 'X'.
    WHEN rb_adi.
      v_operacao = '+'.
    WHEN rb_sub.
      v_operacao = '-'.
    WHEN rb_mul.
      v_operacao = '*'.
    WHEN rb_div.
      v_operacao = '/'.
  ENDCASE.

  mo_calculadora->calcular( EXPORTING
                            operador1 = p_oper1
                            operador2 = p_oper2
                            operacao = v_operacao
                            IMPORTING
                            resultado = v_resultado ).

END-OF-SELECTION.

  WRITE v_resultado.