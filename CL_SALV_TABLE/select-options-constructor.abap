  METHODS: constructor IMPORTING
    i_somatnr  TYPE rseloption "select-option
    i_gart   TYPE c
    i_cen    TYPE C
    i_fini   TYPE sy-datum,
    view_alv IMPORTING i_exit_alv  LIKE it_exit_alv.

  " INI Select-Option

  DATA :it_so TYPE rseloption,
        wa_so TYPE rsdsselopt.

  LOOP AT so_matnr.

      MOVE so_matnr-low TO wa_so-low.
      MOVE so_matnr-high TO wa_so-high.
      MOVE so_matnr-SIGN TO wa_so-SIGN.
      MOVE so_matnr-option TO wa_so-option.
      APPEND wa_so TO it_so.

  ENDLOOP.

  "FIN Select-Option

  CREATE OBJECT ob_data
  EXPORTING
    i_somatnr = it_so ""select-option
    i_gart    = p_gart
    i_cen     = p_cen
    i_fini    = p_fini.
