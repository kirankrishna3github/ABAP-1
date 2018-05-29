Ejecutar del lado de navegador:

REPORT ytempo.

"CALL web address FROM within SAP

DATA: gd_webaddr TYPE string VALUE 'www.sapdev.co.uk'.

CALL METHOD cl_gui_frontend_services=>execute
EXPORTING
  document = gd_webaddr
EXCEPTIONS
  OTHERS   = 1.
