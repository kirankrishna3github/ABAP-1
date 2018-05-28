CLASS cl_alv DEFINITION.

  PUBLIC SECTION.
CLASS-METHODS refresh_grid IMPORTING i_grid TYPE REF TO cl_gui_alv_grid. " Refrescar para mantener el foco y posicion en la celda seleccionada
  PRIVATE SECTION.
     lr_grid   TYPE REF TO cl_gui_alv_grid.
     ENDCLASS.  
     
     
CLASS cl_alv IMPLEMENTATION.
METHOD refresh_grid.

    DATA:
        i_soft             TYPE xfeld  VALUE abap_true,
        i_set_current      TYPE xfeld  VALUE abap_true,
        i_set_selected     TYPE xfeld  VALUE abap_false,
        lv_scroll_row_no   TYPE lvc_s_roid,
        lv_scroll_row_info TYPE lvc_s_row,
        lv_scroll_col_info TYPE lvc_s_col,
        lv_cell_row_no     TYPE lvc_s_roid,
        lv_cell_row_id     TYPE lvc_s_row,
        lv_cell_col_id     TYPE lvc_s_col,
        mt_sel_cells       TYPE lvc_t_ceno,
        mt_sel_rows        TYPE lvc_t_row.


* Save the scroll info
    i_grid->get_scroll_info_via_id(
    IMPORTING
      es_row_no   = lv_scroll_row_no
      es_row_info = lv_scroll_row_info
      es_col_info = lv_scroll_col_info
      ).
* Save info about last selected cell
    i_grid->get_current_cell(
      IMPORTING
        es_row_id = lv_cell_row_id
        es_col_id = lv_cell_col_id
        es_row_no = lv_cell_row_no
    ).

    i_grid->get_selected_rows(
  IMPORTING
    et_index_rows = mt_sel_rows
  ).

* If no row is selected save info about selected cells
    IF mt_sel_rows[] IS INITIAL.
      i_grid->get_selected_cells_id(
        IMPORTING
          et_cells = mt_sel_cells
      ).
    ENDIF.

* ALV Grid refresh
    i_grid->refresh_table_display( i_soft_refresh = i_soft ).


* Restore the saved selection
    IF i_set_selected EQ abap_true.
      IF mt_sel_cells[] IS NOT INITIAL.
        i_grid->set_selected_cells_id( it_cells = mt_sel_cells   ).
      ELSE.
        i_grid->set_selected_rows(
          it_index_rows            = mt_sel_rows
        ).
      ENDIF.
    ENDIF.

* Restore previously saved scroll position
    i_grid->set_scroll_info_via_id(
      is_row_info = lv_scroll_row_info
      is_col_info = lv_scroll_col_info
      is_row_no   = lv_scroll_row_no
    ).

* Set focus on previously selected cell
    IF i_set_current EQ abap_true.
      i_grid->set_current_cell_via_id(
        is_row_id    = lv_cell_row_id
        is_column_id = lv_cell_col_id
        is_row_no    = lv_cell_row_no ).
    ENDIF.

  ENDMETHOD.                    "refresh_grid
    ENDCLASS.  
    
    " lo llamamos
    
      cl_alv=>refresh_grid( i_grid = lr_grid  ).
