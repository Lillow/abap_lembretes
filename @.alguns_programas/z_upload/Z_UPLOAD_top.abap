TYPES: BEGIN OF ty_upload,
         dados TYPE CHAR1000sf,
       END OF ty_upload,

       BEGIN OF ty_cliente,
         nome TYPE char60,
         data TYPE char10,
         hora TYPE char8,
       END OF ty_cliente.

DATA: t_cliente TYPE TABLE OF ty_cliente.