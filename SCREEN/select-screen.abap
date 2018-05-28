


"RADIO BUTTONS

"P_RB1--> Reporte consumo energía eléctrica--> LV_TEXT2
"""P_RB3--> Cargar datos de consumo--> LV_TEXT4
"""""P_RB7--> Consumos $ --> LV_TEX10
"""""P_RB8--> Consumos MWh --> LV_TEX11
"""P_RB4--> Visualizar reporte de consumos--> LV_TEXT5
"""""P_RB9--> Periodo Individual-->LV_TEXT14
""""P_RB10--> Acomulado Mensual-->LV_TEXT15
"P_RB2--> Reporte consumo agua--> LV_TEXT3
"""P_RB5--> Cargar datos de consumo--> LV_TEXT6
"""P_RB6--> Visualizar reporte de consumos--> LV_TEXT7
"""""P_RB11--> Periodo Individual-->LV_TEXT16
""""P_RB12--> Acomulado Mensual-->LV_TEXT17

" Pantalla principal

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE lv_text1.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb1 RADIOBUTTON GROUP rd1 DEFAULT 'X' USER-COMMAND uc1.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text2.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb2 RADIOBUTTON GROUP rd1.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text3.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b1.

" Pantalla reporte energia electrica

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE lv_text0.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb3 RADIOBUTTON GROUP rd2 DEFAULT 'X'  USER-COMMAND uc2.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text4.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb4 RADIOBUTTON GROUP rd2.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text5.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b2.

" Pantalla carga de datos volumenes consumidos

SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE lv_text9.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb7 RADIOBUTTON GROUP rd4 DEFAULT 'X' USER-COMMAND uc4.

SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex10.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb8 RADIOBUTTON GROUP rd4.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex11.

SELECTION-SCREEN END OF LINE.

" Parametros reporte consumo energia electrica

PARAMETERS:

"CONSUMOS $

p_soc1 TYPE ztc_energia_peso-bukrs MODIF ID soc OBLIGATORY DEFAULT 'PROF', "Sociedad
p_prov TYPE ztc_energia_peso-proveedor MODIF ID pro OBLIGATORY," Proveedor
p_ejer1 TYPE ztc_energia_peso-gjahr MODIF ID ejr OBLIGATORY," Ejercio
p_per1 TYPE ztc_energia_peso-poper MODIF ID per OBLIGATORY, " Periodo
p_ver1 TYPE  ztc_energia_peso-version MODIF ID ver OBLIGATORY, "Version
p_cons TYPE ztc_energia_peso-consumos MODIF ID con , " Consumo
p_scost TYPE ztc_energia_peso-sobrecostos MODIF ID sco, " Sobrecostos
p_ff TYPE ztc_energia_peso-fondfidu MODIF ID ff, "Fondo Fiduciario

" CONSUMOS MWh

p_soc4 TYPE ztc_energia_mwh-bukrs MODIF ID sc3 DEFAULT 'PROF', " Sociedad
p_ejer2 TYPE ztc_energia_mwh-gjahr MODIF ID eje OBLIGATORY, " Ejercicio
p_per2 TYPE ztc_energia_mwh-poper MODIF ID ped OBLIGATORY, " Periodo
p_ver2 TYPE  ztc_energia_mwh-version MODIF ID vrn OBLIGATORY, " Version
*{ REPLACE @MOD001
*  p_courea(13) TYPE p DECIMALS 3 MODIF ID CO," ceco = 700300 Urea
*  p_conh3(13) TYPE p DECIMALS 3 MODIF ID co2." ceco = 700210 Amoniaco
p_courea(13) TYPE p DECIMALS 3 MODIF ID co OBLIGATORY," ceco = 700300 Urea
p_conh3(13) TYPE p DECIMALS 3 MODIF ID co2 OBLIGATORY." ceco = 700210 Amoniaco
*} REPLACE @MOD001

SELECTION-SCREEN END OF BLOCK b4.

" reporte energia electrica y visualizar reporte de consumos

SELECTION-SCREEN BEGIN OF BLOCK b5 WITH FRAME TITLE lv_tex12.

PARAMETERS:  p_soc2 TYPE ztc_energia_peso-bukrs MODIF ID sc1 DEFAULT 'PROF', " Sociedad
p_ejer3 TYPE ztc_energia_peso-gjahr MODIF ID ej1, " Ejercio
p_ver3 TYPE  ztc_energia_peso-version MODIF ID vn1. " Version

**     Inicio ALEX2
*  PARAMETERS: P_UKURS TYPE UKURs_d MODIF ID SO1. " VISIBLE LENGTH 13.
**  PARAMETERS: P_UKURS TYPE p DECIMALS 5 MODIF ID SO1.
**     Fin

" Periodo Individual

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb9 RADIOBUTTON GROUP rd5 DEFAULT 'X' USER-COMMAND uc5.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex14.

SELECTION-SCREEN END OF LINE.

" Acomulado Mensual

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb10 RADIOBUTTON GROUP rd5.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex15.

SELECTION-SCREEN END OF LINE.

SELECT-OPTIONS: so_p_ind FOR ztc_energia_peso-poper NO INTERVALS NO-EXTENSION MODIF ID so1,
so_a_men FOR ztc_energia_peso-poper MODIF ID so2.

*{ delete @mod002
* Inicio ALEX2
*PARAMETERS: p_ukurs TYPE ukurs_d MODIF ID SO2. " VISIBLE LENGTH 13.
*  PARAMETERS: P_UKURS TYPE p DECIMALS 5 MODIF ID SO1.
* Fin
*} delete @mod002
SELECTION-SCREEN END OF BLOCK b5.

" Pantalla reporte consumo agua

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE lv_text8.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb5 RADIOBUTTON GROUP rd3 DEFAULT 'X' USER-COMMAND uc3.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text6.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb6 RADIOBUTTON GROUP rd3.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_text7.

SELECTION-SCREEN END OF LINE.

" Parametros Reporte consumo agua

PARAMETERS:
p_soc_ag TYPE ztc_agua-bukrs MODIF ID sag OBLIGATORY DEFAULT 'PROF', " Sociedad
p_pro_ag TYPE ztc_agua-proveedor MODIF ID pag OBLIGATORY," Proveedor
p_eje_ag TYPE ztc_agua-gjahr MODIF ID eag OBLIGATORY," Ejercicio
p_per_ag TYPE ztc_agua-poper MODIF ID peg OBLIGATORY," Periodo
p_ver_ag TYPE ztc_agua-version MODIF ID vag OBLIGATORY,"Version
p_tcr(13) TYPE p DECIMALS 4 MODIF ID tcr," Tarifa consumo real
p_tdn(13) TYPE p DECIMALS 4 MODIF ID tdn, " Tarifa disponibilidad neta
p_cr TYPE ztc_agua-consreal MODIF ID cr, " consumo real m3
p_cad TYPE ztc_agua-consdiario MODIF ID cad, " consumo asegurado m3 diario
p_agurea TYPE ztc_agua-valor MODIF ID co3," ceco = 700300 Urea
p_agnh3 TYPE ztc_agua-valor MODIF ID co4." ceco = 700210 Amoniaco

SELECTION-SCREEN END OF BLOCK b3.

" reporte consumo agua y visualizar reporte de consumos

SELECTION-SCREEN BEGIN OF BLOCK b6 WITH FRAME TITLE lv_tex13.

PARAMETERS:
p_soc3 TYPE ztc_agua-bukrs MODIF ID sc2 DEFAULT 'PROF', " Sociedad
p_ejer4 TYPE ztc_agua-gjahr MODIF ID ej2, " Ejercio
p_ver4 TYPE  ztc_agua-version MODIF ID vn2. " Version

" Periodo Individual

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb11 RADIOBUTTON GROUP rd6 DEFAULT 'X' USER-COMMAND uc6.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex16.

SELECTION-SCREEN END OF LINE.

" Acomulado Mensual

SELECTION-SCREEN BEGIN OF LINE.

PARAMETERS: p_rb12 RADIOBUTTON GROUP rd6.
SELECTION-SCREEN POSITION 5.
SELECTION-SCREEN COMMENT 3(50) lv_tex17.

SELECTION-SCREEN END OF LINE.

SELECT-OPTIONS: so_pind2 FOR ztc_agua-poper NO INTERVALS NO-EXTENSION MODIF ID so3, " Periodo individual
so_amen2 FOR ztc_energia_peso-poper MODIF ID so4." Acomulado mensual

SELECTION-SCREEN END OF BLOCK b6.


*{ insert @mod002


SELECTION-SCREEN BEGIN OF BLOCK b7 WITH FRAME TITLE lv_tex18.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 45(16) button USER-COMMAND BTN_TCA.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b7.

AT SELECTION-SCREEN.
IF sscrfields-ucomm EQ 'BTN_TCA'.
  CALL FUNCTION 'VIEW_MAINTENANCE_CALL'
  EXPORTING
    action                         = 'S'
    view_name                      = 'ZTC_TIPOCAMBIO'.
ENDIF.

*} insert @mod002



AT SELECTION-SCREEN OUTPUT.

  PERFORM screen_change.

  " ini Combinar radio button y campos obligatorios.

  LOOP AT SCREEN.

    IF screen-name EQ 'P_SOC1' OR
    screen-name EQ 'P_PROV' OR
    screen-name EQ 'P_EJER1' OR
    screen-name EQ 'P_PER1' OR
    screen-name EQ 'P_VER1' OR
    screen-name EQ 'P_EJER2' OR
    screen-name EQ 'P_PER2' OR
    screen-name EQ 'P_VER2' OR
    screen-name EQ 'P_SOC_AG' OR
    screen-name EQ 'P_PRO_AG' OR
    screen-name EQ 'P_EJE_AG' OR
    screen-name EQ 'P_PER_AG' OR
    screen-name EQ 'P_VER_AG'
*{ INSERT @MOD001
    OR screen-name EQ 'P_COUREA' OR screen-name EQ 'P_CONH3'.
*} *{ INSERT @MOD001
      screen-required = '2'."salta la validacion de campo obligatorio al hacer click en otro radio button

    ENDIF.

* Inicio ALEX2
*    IF screen-name = 'P_UKURS'.
*      IF p_rb1 IS NOT INITIAL AND p_rb4 IS NOT INITIAL.
*        screen-input = '1'.
*        screen-invisible = '0'.
*      ELSE.
*        screen-input = '0'.
*        screen-invisible = '1'.
*      ENDIF.
*    ENDIF.
* Fin

      MODIFY SCREEN.

    ENDLOOP.

AT SELECTION-SCREEN ON: p_soc1,p_prov,p_ejer1,p_per1,p_ver1,p_soc4,p_ejer2,p_per2,p_ver2,
p_soc_ag,
p_eje_ag,
p_per_ag,
p_pro_ag,
p_ver_ag  .

  IF  sy-ucomm EQ 'ONLI' ."AND p_rb4 EQ ' ' AND p_rb6 EQ ' '.

    IF p_rb1 EQ 'X' AND p_rb3 EQ 'X'. " Tilde en  repor consumo energia y cargar datos consumo

      IF p_rb7 EQ 'X'." Consumos $

        IF p_soc1 IS  INITIAL OR
        p_prov IS INITIAL OR
        p_ejer1 IS INITIAL OR
        p_per1 IS INITIAL OR
        p_ver1 IS INITIAL.

          CALL FUNCTION 'POPUP_TO_DISPLAY_TEXT'
            EXPORTING
              titel        = 'Advertencia'
              textline1    = 'Complete todos los campos obligatorios por favor.'
              start_column = 15
              start_row    = 6.

          EXIT.

        ENDIF.

      ELSEIF p_rb8 EQ 'X'." Consumos Mwh

        IF p_soc4 IS INITIAL OR
        p_ejer2 IS INITIAL OR
        p_per2 IS INITIAL OR
        p_ver2 IS INITIAL OR
*{ INSERT @MOD001
        p_courea IS INITIAL OR
        p_conh3 IS INITIAL.
*}INSERT @MOD001
          CALL FUNCTION 'POPUP_TO_DISPLAY_TEXT'
            EXPORTING
              titel        = 'Advertencia'
              textline1    = 'Complete todos los campos obligatorios por favor.'
              start_column = 15
              start_row    = 6.

          EXIT.

        ENDIF.

      ENDIF.

    ENDIF.

    IF p_rb2 EQ 'X' AND p_rb5 EQ 'X'. " report consumo agua y cargar datos consumo

      IF p_soc_ag IS INITIAL OR
      p_eje_ag IS INITIAL OR
      p_per_ag IS INITIAL OR
      p_pro_ag IS INITIAL OR
      p_ver_ag IS INITIAL .

        CALL FUNCTION 'POPUP_TO_DISPLAY_TEXT'
          EXPORTING
            titel        = 'Advertencia'
            textline1    = 'Complete todos los campos obligatorios por favor.'
            start_column = 15
            start_row    = 6.

        EXIT.

      ENDIF.

    ENDIF.

  ENDIF.

  " fin Combinar radio button y campos obligatorios

  " INI MATCHCODE ZF012->ZGLR0002-->ID-->01..06

*Se emplea el evento de valor de respuesta especifico al campo.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_prov." ZF012->ZGLR0002->ID:01->Proveedores EE

  IF lines( it_rango01 ) EQ 0.

    CALL FUNCTION 'ZBC_OBTENER_ZF012'
      EXPORTING
        i_programm  = 'ZGLR0003'
        i_param_id  = '01'
        i_separador = ';'
      TABLES
        t_rango     = it_rango01.

    LOOP AT it_rango01 INTO wa_rango01.

      wa_text_prov-texto = wa_rango01-low.
      APPEND wa_text_prov TO it_text_prov.
      CLEAR wa_text_prov.

    ENDLOOP.

  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'TEXTO'
      window_title    = 'Proveedores'
      value_org       = 'S'
    TABLES
      value_tab       = it_text_prov
      return_tab      = it_match
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE it_match INDEX 1 INTO wa_match.
    p_prov = wa_match-fieldval.
    CLEAR wa_match.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_ver1." ZF012->ZGLR0002->ID:05->Versión

  IF lines( it_rango05 ) EQ 0.

    CALL FUNCTION 'ZBC_OBTENER_ZF012'
      EXPORTING
        i_programm  = 'ZGLR0003'
        i_param_id  = '05'
        i_separador = ';'
      TABLES
        t_rango     = it_rango05.

    LOOP AT it_rango05 INTO wa_rango05.

      wa_text_ver-texto = wa_rango05-low.
      APPEND wa_text_ver TO it_text_ver.
      CLEAR wa_text_ver.

    ENDLOOP.

  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'TEXTO'
      window_title    = 'Versiónes'
      value_org       = 'S'
    TABLES
      value_tab       = it_text_ver
      return_tab      = it_match
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE it_match INDEX 1 INTO wa_match.
    p_ver1 = wa_match-fieldval.
    CLEAR wa_match.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_ver2."ZF012->ZGLR0002->ID:05->Versión

  REFRESH it_rango05.

  CALL FUNCTION 'ZBC_OBTENER_ZF012'
    EXPORTING
      i_programm  = 'ZGLR0003'
      i_param_id  = '05'
      i_separador = ';'
    TABLES
      t_rango     = it_rango05.

  REFRESH :it_text_ver.

  LOOP AT it_rango05 INTO wa_rango05.

    wa_text_ver-texto = wa_rango05-low.
    APPEND wa_text_ver TO it_text_ver.
    CLEAR wa_text_ver.

  ENDLOOP.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'TEXTO'
      window_title    = 'Versiónes'
      value_org       = 'S'
    TABLES
      value_tab       = it_text_ver
      return_tab      = it_match
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE it_match INDEX 1 INTO wa_match.
    p_ver2 = wa_match-fieldval.
    CLEAR wa_match.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_pro_ag." ZF012->ZGLR0002->ID:06->Proveedor de Agua

  IF lines( it_rango06 ) EQ 0.
    CALL FUNCTION 'ZBC_OBTENER_ZF012'
      EXPORTING
        i_programm  = 'ZGLR0003'
        i_param_id  = '06'
        i_separador = ';'
      TABLES
        t_rango     = it_rango06.

    LOOP AT it_rango06 INTO wa_rango06.

      wa_text_proag-texto = wa_rango06-low.
      APPEND wa_text_proag TO it_text_proag.
      CLEAR wa_text_proag.

    ENDLOOP.

  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'TEXTO'
      window_title    = 'Proveedores'
      value_org       = 'S'
    TABLES
      value_tab       = it_text_proag
      return_tab      = it_match
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE it_match INDEX 1 INTO wa_match.
    p_pro_ag = wa_match-fieldval.
    CLEAR wa_match.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_ver_ag." ZF012->ZGLR0002->ID:05->Version

  REFRESH it_rango05.

  CALL FUNCTION 'ZBC_OBTENER_ZF012'
    EXPORTING
      i_programm  = 'ZGLR0003'
      i_param_id  = '05'
      i_separador = ';'
    TABLES
      t_rango     = it_rango05.

  REFRESH :it_text_ver.

  LOOP AT it_rango05 INTO wa_rango05.

    wa_text_ver-texto = wa_rango05-low.
    APPEND wa_text_ver TO it_text_ver.
    CLEAR wa_text_ver.

  ENDLOOP.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'TEXTO'
      window_title    = 'Versiones'
      value_org       = 'S'
    TABLES
      value_tab       = it_text_ver
      return_tab      = it_match
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE it_match INDEX 1 INTO wa_match.
    p_ver_ag = wa_match-fieldval.
    CLEAR wa_match.
  ENDIF.

* FIN INI MATCHCODE ZF012->ZGLR0002-->ID-->01..06
