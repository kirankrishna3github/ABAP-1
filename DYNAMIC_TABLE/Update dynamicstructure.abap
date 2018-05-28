
report.

data table_data type ref to data.

perform initialize_table using 5 5 changing table_data.

break-point. " check table_data in debugger

form initialize_table using width type i height type i changing board type ref to data.
  if ( width < 1 or height < 1 ). return. endif. 
  data: dynamic_table type ref to data.
  data: dynamic_row   type ref to data.
  data: col_index type i value 1.
  data: columns type lvc_t_fcat.
  data: column  like line of columns.
  field-symbols <table> type any table.
  field-symbols <row> type any.

  do width times.
    column-fieldname = '_' && col_index.
    column-datatype  = cl_abap_structdescr=>typekind_char.
    column-inttype   = cl_abap_structdescr=>typekind_char.
    column-intlen    = 1.
    column-decimals  = 0.
    col_index = col_index + 1.
    append column to columns.
  enddo.

  cl_alv_table_create=>create_dynamic_table(
    exporting it_fieldcatalog = columns
    importing ep_table = dynamic_table
  ).
  " The data has to be accessed via a field symbol.
  assign dynamic_table->* to <table>.
  create data dynamic_row like line of <table>.

  assign dynamic_row->* to <row>.
  do height times.
    insert <row> into table <table>.
  enddo.
endform.
