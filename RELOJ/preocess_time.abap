  DO 3 TIMES.

    cl_progress_indicator=>progress_indicate(
      EXPORTING
        i_text               = | ─═☆☆═─ Tx created by XXXX ─═☆☆═─ |
        i_processed          = sy-index
        i_total              = 3
        i_output_immediately = abap_true
    ).
    WAIT UP TO 1 SECONDS.

  ENDDO.
