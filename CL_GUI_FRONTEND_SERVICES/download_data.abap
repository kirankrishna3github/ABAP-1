REPORT ytempo.

TABLES rlgrap.

DATA: it_tab TYPE filetable,
      gd_subrc TYPE I.

selection-SCREEN BEGIN OF BLOCK M WITH FRAME.
  SELECT-options so_fpath FOR rlgrap-filename.
selection-SCREEN END OF BLOCK M.

AT selection-SCREEN ON VALUE-request FOR so_fpath-low.

REFRESH: it_tab.
CALL METHOD CL_GUI_FRONTEND_SERVICES=>FILE_OPEN_DIALOG
EXPORTING
  WINDOW_TITLE = 'Select File'
  DEFAULT_FILENAME = '*.txt'
  MULTISELECTION = 'X'
CHANGING
  FILE_TABLE = it_tab
  RC = gd_subrc.
