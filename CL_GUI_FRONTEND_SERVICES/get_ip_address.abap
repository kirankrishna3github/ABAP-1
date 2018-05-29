" Para obtener la ip de nuestra maquina

REPORT ytempo.

DATA vg_ip TYPE string.

cl_gui_frontend_services=>get_ip_address( RECEIVING ip_address = vg_ip ).

WRITE: vg_ip.
