*--------------------------------------------------------------------*
*& ID Mod.........  Initial                                                     
*& Programador....: Marks, Matías Andrés ( BAT )                       
*& Fecha..........: 21.10.2016 15:44:00
*& Nro. Ticket....:
*& Orden/Tarea....:                                                  
*& Descripción....: new form for concatenate                                                                
*--------------------------------------------------------------------*
REPORT YTEMPO.

DATA: lv_data1 TYPE string VALUE 'SAP',
      lv_data2 TYPE string VALUE 'ABAP',
      lv_data3 TYPE string.

"Antes

CONCATENATE 'VALUE 1 =' lv_data1 ',' 'VALUE 2 =' lv_data2 INTO lv_data3.

WRITE: / lv_data3.

"Ahora

lv_data3 = |VALUE 1 = { lv_data1 },| && |VALUE 2 = { lv_data2 }. |.

WRITE: / lv_data3.
