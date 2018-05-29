
 REPORT YTEMPO.
 
  DATA lv_returncode.

  REFRESH it_sval.

  CLEAR wa_sval.
  wa_sval-tabname   = 'ZSDTREFPRICES'.
  wa_sval-fieldname = 'MINIMO'.
  wa_sval-fieldtext = 'Valor minimo'.
  wa_sval-value     = 5.
  APPEND wa_sval TO it_sval.

  CLEAR wa_sval.
  wa_sval-tabname   = 'ZSDTREFPRICES'.
  wa_sval-fieldname = 'MAXIMO'.
  wa_sval-fieldtext = 'Valor maximo'.
  wa_sval-value     = 15.
  APPEND wa_sval TO it_sval.

  CALL FUNCTION 'POPUP_GET_VALUES'
    EXPORTING
      popup_title  = 'Banda de comparación'
      start_column = '5'
      start_row    = '5'
    IMPORTING
      returncode   = lv_returncode
    TABLES
      fields       = it_sval.


  IF lv_returncode EQ 'A'.

    LEAVE TO SCREEN 0.

  ENDIF.
