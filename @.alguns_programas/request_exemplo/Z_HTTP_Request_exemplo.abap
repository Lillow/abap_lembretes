
*&---------------------------------------------------------------------*
*& Z_HTTP_Request_exemplo
*&---------------------------------------------------------------------*

DATA: lo_http_client TYPE REF TO cl_http_client,
      lv_url         TYPE string,
      lv_response     TYPE string,
      lv_status_code  TYPE i.

lv_url = 'http://api.exemplo.com/dados'.

" Criar cliente HTTP
CALL METHOD cl_http_client=>create_by_url
  EXPORTING
    url                = lv_url
  IMPORTING
    client             = lo_http_client
  EXCEPTIONS
    others             = 1.

" Enviar a requisição GET
CALL METHOD lo_http_client->send
  EXCEPTIONS
    others = 1.

" Receber a resposta
CALL METHOD lo_http_client->receive
  IMPORTING
    response    = lv_response
    status_code = lv_status_code
  EXCEPTIONS
    others = 1.

IF lv_status_code = 200.
  " Processar a resposta
  WRITE: / 'Resposta:', lv_response.
ELSE.
  WRITE: / 'Erro:', lv_status_code.
ENDIF.

" Fechar a conexão
CALL METHOD lo_http_client->close.
