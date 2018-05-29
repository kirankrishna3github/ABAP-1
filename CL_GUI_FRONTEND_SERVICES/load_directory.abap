*Selecting a Directory

REPORT ytempo.

*The following declaration may need to be 'gd_path(500) type c.' in older versions of SAP"
DATA: gd_path TYPE string.

PARAMETERS: p_path LIKE rlgrap-filename.

AT selection-SCREEN ON VALUE-request FOR p_path.

CALL METHOD cl_gui_frontend_services=>directory_browse
EXPORTING window_title = 'File Directory'
  initial_folder = 'C:'
CHANGING selected_folder = gd_path.

CALL METHOD cl_gui_cfw=>flush.

CONCATENATE gd_path '' INTO p_path.
