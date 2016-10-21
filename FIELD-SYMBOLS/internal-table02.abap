REPORT YTEMPO2.

TYPES:BEGIN OF ty_alv_data,
  kunnr   TYPE kunnr,
  name1   TYPE name1,
  ort01   TYPE ort01,
  land1   TYPE land1,
  t_color TYPE lvc_t_scol,
END   OF ty_alv_data.

TYPES: tt_alv_data TYPE STANDARD TABLE OF ty_alv_data WITH DEFAULT KEY.

DATA: o_alv_data_c TYPE REF TO DATA.

FIELD-SYMBOLS: <ft_a> TYPE tt_alv_data,
<fs_a>   LIKE LINE OF <ft_a>,
<fs_col> LIKE LINE OF <fs_a>-t_color.

CREATE DATA o_alv_data_c TYPE tt_alv_data.

ASSIGN o_alv_data_c->* TO <ft_a>.

APPEND INITIAL LINE TO <ft_a> ASSIGNING <fs_a>.

<fs_a>-kunnr = '123'.
<fs_a>-name1 = 'ABCD'.
<fs_a>-ort01 = 'LV'.
<fs_a>-land1 = 'NV'.

APPEND INITIAL LINE TO <fs_a>-t_color ASSIGNING <fs_col>.

<fs_col>-fname = 'KUNNR'.
<fs_col>-COLOR-col = 7.
<fs_col>-COLOR-int = 0.
<fs_col>-COLOR-inv = 0.

LOOP AT <ft_a> ASSIGNING <fs_a>.

  WRITE: / <fs_a>-kunnr INTENSIFIED NO-GAP.

ENDLOOP.
