REPORT YTEMPO.

  DATA: li_ret TYPE TABLE OF ddshretval,
        le_ret TYPE ddshretval.

  FIELD-SYMBOLS: <fs_alv_zsdtgastosnac> TYPE ty_alv_zsdtgastosnac.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'INCO1'
      dynpprog        = sy-repid
      dynpnr          = ''
      dynprofield     = ''
      value_org       = 'S'
*     multiple_choice = 'X'
    TABLES
      value_tab       = it_tinc
      return_tab      = li_ret
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.

    READ TABLE li_ret INTO le_ret INDEX 1.
    READ TABLE it_alv_zsdtgastosnac ASSIGNING <fs_alv_zsdtgastosnac> INDEX pe_row_id.

    <fs_alv_zsdtgastosnac>-inco1 = le_ret-fieldval.

  ENDIF.

  UNASSIGN <fs_alv_zsdtgastosnac>.
