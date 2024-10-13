REPORT zabap06_dml.

* Insert
DATA: wa_aluno TYPE zacademia06,
      t_aluno  TYPE TABLE OF zacademia06.

wa_aluno-cod_aluno = '0000000001'.
wa_aluno-nome = 'Danillo'.
append wa_aluno to t_aluno.
clear wa_aluno.

wa_aluno-cod_aluno = '0000000002'.
wa_aluno-nome = 'Silva'.
append wa_aluno to t_aluno.
clear wa_aluno.

INSERT zacademia06 FROM TABLE t_aluno.
IF sy-subrc IS INITIAL.
  COMMIT WORK AND WAIT.
ELSE.
  ROLLBACK WORK.
ENDIF.