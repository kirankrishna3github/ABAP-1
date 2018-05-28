REPORT zprueba003.

DATA: t_fieldcat TYPE lvc_t_fcat,
t_fieldcat_wa TYPE LINE OF lvc_t_fcat.

DATA: tabla TYPE REF TO data.

START-OF-SELECTION.

t_fieldcat_wa-col_pos = '1'.
t_fieldcat_wa-fieldname = 'DOCUM'.
t_fieldcat_wa-ref_table = 'VBAK'.
t_fieldcat_wa-ref_field = 'VBELN'.
APPEND t_fieldcat_wa TO t_fieldcat.
CLEAR t_fieldcat_wa.

t_fieldcat_wa-col_pos = '2'.
t_fieldcat_wa-fieldname = 'POSIC'.
t_fieldcat_wa-ref_table = 'VBAP'.
t_fieldcat_wa-ref_field = 'POSNR'.
APPEND t_fieldcat_wa TO t_fieldcat.
CLEAR t_fieldcat_wa.

t_fieldcat_wa-col_pos = '3'.
t_fieldcat_wa-fieldname = 'STATU'.
t_fieldcat_wa-ref_table = 'VBUK'.
t_fieldcat_wa-ref_field = 'WBSTK'.
APPEND t_fieldcat_wa TO t_fieldcat.
CLEAR t_fieldcat_wa.


CALL METHOD cl_alv_table_create=>create_dynamic_table
EXPORTING
* I_STYLE_TABLE =
it_fieldcatalog = t_fieldcat
* I_LENGTH_IN_BYTE =
IMPORTING
ep_table = tabla
* E_STYLE_FNAME =
* EXCEPTIONS
* GENERATE_SUBPOOL_DIR_FULL = 1
* others = 2
.
IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
* WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.

