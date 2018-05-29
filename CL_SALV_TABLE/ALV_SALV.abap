
  REPORT YTEMPO.
  
  TYPES:BEGIN OF ty_zsdtgastosnac.
          INCLUDE TYPE zsdtgastosnac.
  TYPES:END OF ty_zsdtgastosnac.

  DATA: it_zsdtgastosnac TYPE STANDARD TABLE OF ty_zsdtgastosnac INITIAL SIZE 0,
        wa_zsdtgastosnac TYPE ty_zsdtgastosnac.

  DATA:      lv_functions  TYPE REF TO cl_salv_functions_list,
             lv_cols       TYPE REF TO cl_salv_columns_table,
             lv_column     TYPE REF TO cl_salv_column_table,
             layout        TYPE REF TO cl_salv_layout,
             lv_key        TYPE salv_s_layout_key,
             lv_select     TYPE REF TO cl_salv_selections,
             lv_display    TYPE REF TO cl_salv_display_settings,
             ol_alv        TYPE REF TO cl_salv_table.

  REFRESH it_zsdtgastosnac.

  SELECT *
  INTO CORRESPONDING FIELDS OF TABLE it_zsdtgastosnac
  FROM zsdtgastosnac.

  SORT it_zsdtgastosnac BY fecha DESCENDING.

  TRY.
      cl_salv_table=>factory(
*        EXPORTING
*        r_container    = alv4_cont
        IMPORTING
          r_salv_table = ol_alv
        CHANGING
          t_table      = it_zsdtgastosnac ).

    CATCH cx_salv_msg.
  ENDTRY.

*... Show toolbar

  ol_alv->set_screen_status(  pfstatus       = 'SG_ALV_04_CA'
                               report        = sy-repid
                               set_functions = ol_alv->c_functions_all ).

*...Process individual columns if needed

  lv_key-report = sy-repid.
  layout  = ol_alv->get_layout( ). "layouts
  layout->set_key( lv_key ).  "Pass Program Name
  layout->set_save_restriction( cl_salv_layout=>restrict_none ). "User can save

*... Para poder seleccionar más de una fila.

  lv_select = ol_alv->get_selections( ).
  lv_select->set_selection_mode( lv_select->multiple ).


  lv_display = ol_alv->get_display_settings( ).
  lv_display->set_list_header( 'Cargas anteriores' ).
  lv_display->set_striped_pattern( 'X' ). " Zebra


*... Set the Columns settings

  lv_cols = ol_alv->get_columns( ).
  lv_cols->set_optimize( ).

  TRY.

    DEFINE m_columns_log.

      lv_column ?= lv_cols->get_column( &1 ).
      lv_column->set_medium_text( '' ).
      lv_column->set_short_text( ' ' ).
      lv_column->set_long_text( &2 ).

    END-OF-DEFINITION.

    m_columns_log:
   'WERKS'           'Centro',
   'NAME1'           'Descripcion',
   'INCO1'           'Incoterm',
   'CFR'             'Cfr',
   'FECHA'           'Fecha',
   'P_SEG_CAL_ARA'   'P Seg p/Calc de Arancel',
   'SEG_CAL_ARA'     'Seg p/Calc de Arancel',
   'CIF_CAL_ARA'     'CIF p/calc de arancel',
   'P_SEGURO'        'P Seguro',
   'SEGURO'          'Seguro',
   'CIF'             'Cif',
   'P_TASA_NAC'      'P Tasa Nac',
   'TASA_NAC'        'Tasa Nac',
   'ESTADISTICA'     'Estadistica',
   'P_V_IMPOSITIVAS' 'PV Impositivas',
   'V_IMPOSITIVAS'   'V Impositivas',
   'P_COMI_BROKER'   'P Comision Broker',
   'COMI_BROKER'     'Comision Broker',
   'ORG_CONTROL'     'Org Control',
   'DIF_MUELLE'      'Dif Muelle',
   'DIF_LOG'         'Dif Logistico',
   'THROUGHPUT'      'Throughput',
   'NAP'             'Nap'.
  ENDTRY.

  IF ol_alv IS BOUND.

*    ol_alv->set_screen_popup(
*      start_column = 10
*      end_column   = 150
*      start_line   = 5
*      end_line     = 30 ).

    ol_alv->display( ).
    FREE ol_alv.

  ENDIF.
