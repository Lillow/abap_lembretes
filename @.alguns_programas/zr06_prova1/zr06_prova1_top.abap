*&---------------------------------------------------------------------*
*& Include          zr06_prova1_top
*&---------------------------------------------------------------------*

DATA: v_alpha     TYPE p DECIMALS 3,
      v_beta      TYPE p DECIMALS 3,
      v_gama      TYPE p DECIMALS 3,
      v_alpha_int TYPE i,
      v_beta_int  TYPE i,
      v_gama_int  TYPE i,
      v_pi        TYPE f VALUE '3.141592',
      v_etriang   TYPE abap_bool VALUE abap_false, " É possível formar um triângulo?
      v_tipo_med  TYPE char10, " Tipo do triângulo com base nas medidas.
      v_tipo_ang  TYPE char10.  " Tipo do triângulo com base nos ângulos.