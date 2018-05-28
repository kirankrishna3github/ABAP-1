REPORT.

DATA table_data TYPE REF TO data.

PERFORM initialize_table USING 5 5 CHANGING table_data.

BREAK-POINT. " check table_data in debugger

*&---------------------------------------------------------------------*
*&      Form  initialize_table
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->WIDTH      text
*      -->HEIGHT     text
*      -->BOARD      text
*      -->IF         text
*      -->(          text
*      -->WIDTH      text
*      --><          text
*      -->1          text
*      -->OR         text
*      -->HEIGHT     text
*      --><          text
*      -->1          text
*      -->)          text
*----------------------------------------------------------------------*
FORM initialize_table USING width TYPE i height TYPE i CHANGING board TYPE REF TO data.
  IF ( width < 1 OR height < 1 ). RETURN. ENDIF.
  DATA: dynamic_table TYPE REF TO data.
  DATA: dynamic_row   TYPE REF TO data.
  DATA: col_index TYPE i VALUE 1.
  DATA: columns TYPE lvc_t_fcat.
  DATA: column  LIKE LINE OF columns.
  FIELD-SYMBOLS <table> TYPE ANY TABLE.
  FIELD-SYMBOLS <row> TYPE any.

  DO width TIMES.
    column-fieldname = '_' && col_index.
    column-datatype  = cl_abap_structdescr=>typekind_char.
    column-inttype   = cl_abap_structdescr=>typekind_char.
    column-intlen    = 1.
    column-decimals  = 0.
    col_index = col_index + 1.
    APPEND column TO columns.
  ENDDO.

  cl_alv_table_create=>create_dynamic_table(
    EXPORTING it_fieldcatalog = columns
    IMPORTING ep_table = dynamic_table
  ).
  " The data has to be accessed via a field symbol.
  ASSIGN dynamic_table->* TO <table>.
  CREATE DATA dynamic_row LIKE LINE OF <table>.

  ASSIGN dynamic_row->* TO <row>.
  DO height TIMES.
    INSERT <row> INTO TABLE <table>.
  ENDDO.
ENDFORM.                    "initialize_table
