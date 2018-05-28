REPORT ytempo1.


DATA:   l_text TYPE char255,  " Text
        i_content         TYPE   soli_tab, " Mail content
        l_send_request    TYPE REF TO    cl_bcs,
        l_document        TYPE REF TO    cl_document_bcs,
        lr_sender TYPE REF TO if_sender_bcs,
        lr_send TYPE REF TO cl_bcs,
        l_recipient       TYPE REF TO    if_recipient_bcs,
        l_bcs_exception   TYPE REF TO    cx_document_bcs,
        " BCS Exception
        l_addr_exception  TYPE REF TO    cx_address_bcs,
        " Address Exception
        l_send_exception  TYPE REF TO    cx_send_req_bcs,
        lv_fecha TYPE string,
        lv_hora TYPE sy-uzeit,
        lv_texto TYPE so_obj_des,
        p_gv_message TYPE string.

CONSTANTS c_email TYPE ad_smtpadr  VALUE 'xxx@abc.com'. " Quien recive
CONSTANTS c_email2 TYPE ad_smtpadr  VALUE 'xxx@abc.com'. " Quien envia
* Preparing body of the Mail

CONCATENATE 'Error: ' 'XXXXX'  INTO p_gv_message.

MOVE p_gv_message TO l_text.
APPEND l_text TO i_content.
CLEAR l_text.

l_text = 'Por favor, LLAMAME'.
APPEND l_text TO i_content.
CLEAR l_text.

TRY .

    "Create send request

    l_send_request = cl_bcs=>create_persistent( ).

* Creating Document - * Subject.

    CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
      EXPORTING
        date_internal            = sy-datum
      IMPORTING
        date_external            = lv_fecha
      EXCEPTIONS
        date_internal_is_invalid = 1
        OTHERS                   = 2.

    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    CONCATENATE sy-uzeit(2) ':' sy-uzeit+2(2) INTO lv_hora.

    CONCATENATE 'Notif: CATALWEB-SAP,' lv_fecha '-' lv_hora 'CANCEL' INTO lv_texto SEPARATED BY space.

    l_document = cl_document_bcs=>create_document(
    i_type  = 'RAW'
    i_text  = i_content[]
    i_subject = lv_texto ).

* Add document to send request Subject

    CALL METHOD l_send_request->set_document( l_document ).

" INI Email FROM...

    lr_sender = cl_cam_address_bcs=>create_internet_address( c_email2 ).

* Setting the sender

    CALL METHOD l_send_request->set_sender
    EXPORTING
      i_sender = lr_sender.

*FIN  Email FROM...

*INI Email TO...

    l_recipient = cl_cam_address_bcs=>create_internet_address( c_email ).

    CALL METHOD l_send_request->add_recipient
      EXPORTING
        i_recipient  = l_recipient
        i_express    = 'U'
        i_copy       = ' '
        i_blind_copy = ' '
        i_no_forward = ' '.

*FIN Email TO...

* Email con copia a ?

*    l_recipient = cl_cam_address_bcs=>create_internet_address( c_emailc ).
*
*    CALL METHOD l_send_request->add_recipient
*    EXPORTING
*      i_recipient  = l_recipient
*      i_express    = 'U'
*      i_copy       = 'X'
*      i_blind_copy = ' '
*      i_no_forward = ' '.

*Trigger E-Mail immediately

    l_send_request->set_send_immediately( 'X' ).

    CALL METHOD l_send_request->send( ).

    COMMIT WORK.

  CATCH cx_document_bcs INTO l_bcs_exception.
  CATCH cx_send_req_bcs INTO l_send_exception.
  CATCH cx_address_bcs  INTO l_addr_exception.

ENDTRY.
