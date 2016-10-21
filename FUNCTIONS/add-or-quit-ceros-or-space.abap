* Funtion delete with cero or space to left of a variable.

CALL FUNCTION ‘CONVERSION_EXIT_ALPHA_OUTPUT’
 EXPORTING
  INPUT = VG_VARIABLE
 IMPORTING
  OUTPUT = VG_VARIABLE.
  
* Funtion complete with cero or space to left of a variable.

CALL FUNCTION ‘CONVERSION_EXIT_ALPHA_INPUT’
 EXPORTING
  INPUT = VG_VARIABLE
 IMPORTING
  OUTPUT = VG_VARIABLE.
