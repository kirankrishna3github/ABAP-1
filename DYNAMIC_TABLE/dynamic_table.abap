REPORT  zejercicio.

FIELD-SYMBOLS: <fs_itab> TYPE ANY TABLE,
               <wa_itab> TYPE ANY.

DATA: r_linetype TYPE REF TO cl_abap_structdescr,
      r_tabletype TYPE REF TO cl_abap_tabledescr,
      key TYPE abap_keydescr_tab,
      ref_itab TYPE REF TO data,
      new_line TYPE REF TO data.

PARAMETERS pa_tab TYPE dd02l-tabname DEFAULT 'ZTABLA_USUARIOS'.

START-OF-SELECTION.

* Creamos un tipo de tabla utilizando RTTC
  r_linetype ?= cl_abap_typedescr=>describe_by_name( pa_tab ).
  r_tabletype = cl_abap_tabledescr=>create(
  p_line_type = r_linetype ).

* Creación dinamica de la tabla interna
  CREATE DATA ref_itab TYPE HANDLE r_tabletype.
  ASSIGN ref_itab->* TO <fs_itab>.

* Creamos un area de trabajo de la estrcutura de la misma tabla
  CREATE DATA new_line LIKE LINE OF <fs_itab>.
  ASSIGN new_line->* TO <wa_itab>.

  SELECT * FROM (pa_tab)
  INTO TABLE <fs_itab>
  UP TO 3 ROWS.

  LOOP AT <fs_itab> INTO <wa_itab>.

    WRITE: / <wa_itab>.

  ENDLOOP.

