*&---------------------------------------------------------------------*
*& Include          zr06_prova1
*&---------------------------------------------------------------------*

REPORT zr06_prova1.

INCLUDE zr06_prova1_top.
INCLUDE zr06_prova1_sel.


* Regras

INITIALIZATION.


START-OF-SELECTION.
* Verifica se possível formar um triângulo
  IF ( v_ladoA + v_ladoB > v_ladoC ) AND
     ( v_ladoB + v_ladoC > v_ladoA ) AND
     ( v_ladoA + v_ladoC > v_ladoB ).
    v_etriang = abap_true.
  ENDIF.

  IF v_etriang = abap_true.
    WRITE: / 'Triângulo válido',
          / .

* Calcula o teorema de Pitágoras
    v_alpha = ( v_ladoB ** 2 + v_ladoC ** 2 - v_ladoA ** 2 ) / ( 2 * v_ladoB * v_ladoC ).
    v_beta  = ( v_ladoC ** 2 + v_ladoA ** 2 - v_ladoB ** 2 ) / ( 2 * v_ladoC * v_ladoA ).
    v_gama  = ( v_ladoA ** 2 + v_ladoB ** 2 - v_ladoC ** 2 ) / ( 2 * v_ladoA * v_ladoB ).

* Calcula o Arc Cosseno
    v_alpha = acos( v_alpha ).
    v_beta  = acos( v_beta ).
    v_gama  = acos( v_gama ).

* Calcula o ângulo em graus
    v_alpha = ( v_alpha * 180 / v_pi * 1000 ) / 1000.
    v_alpha_int = v_alpha.
    v_beta  = ( v_beta * 180 / v_pi * 1000 ) / 1000.
    v_beta_int = v_beta.
    v_gama  = ( v_gama * 180 / v_pi * 1000 ) / 1000.
    v_gama_int = v_gama.


    WRITE: / '  Lado A:', v_ladoA,
           / '  Lado B:', v_ladoB,
           / '  Lado C:', v_ladoC,
           /.


    WRITE: / '  Angulo Alpha:',v_alpha,
           / '  Angulo Beta:', v_beta,
           / '  Angulo Gama:', v_gama,
           / .

* Verifica tipo do triângulo
    IF v_ladoA = v_ladoB OR v_ladoA = v_ladoC OR v_ladoB = v_ladoC. " Isósceles
      v_tipo_med = 'Isósceles'.
      IF v_ladoA = v_ladoB AND v_ladoA = v_ladoC. " Equilátero
        v_tipo_med = 'Equilátero'.
      ENDIF.
    ELSE.
      v_tipo_med = 'Escaleno'.
    ENDIF.

* Determinar o tipo de triângulo
    IF v_alpha_int = 90 OR v_beta_int = 90 OR v_gama_int = 90. " Retângulo
      v_tipo_ang = 'Retângulo'.
    ELSEIF v_alpha_int < 90 AND v_beta_int < 90 AND v_gama_int < 90. " Acutângulo
      v_tipo_ang = 'Acutângulo'.
    ELSE. " Obtusângulo
      v_tipo_ang = 'Obtusângulo'.
    ENDIF.

    WRITE: / 'Tipo c/ base na medida: Triângulo ', v_tipo_med,
           / 'Tipo c/ base no ângulo: Triângulo ', v_tipo_ang.

  ELSE.
    WRITE: / 'Não é possível formar um triângulo com as medidas fornecidas.'.
  ENDIF.

END-OF-SELECTION.