CLASS zabap010_sa_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZABAP010_SA_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
            lv_int1     TYPE i,
            lv_op(1)    TYPE c,
            lv_int2     TYPE i,
            lv_result   TYPE p DECIMALS 5.

    lv_int1 = 22.
    lv_op   = '/'.
    lv_int2 = 7.

    IF NOT ( lv_op = '+' OR lv_op = '-' OR lv_op = '*' OR lv_op = '/' ).
        out->write( EXPORTING data = 'Invalid operator.' ).
    ELSEIF lv_op = '/' AND lv_int2 = 0.
        out->write( EXPORTING data = 'Division by zero' ).
    ELSE.
        CASE lv_op.
            WHEN '+'.
                lv_result = lv_int1 + lv_int2.
            WHEN '-'.
                lv_result = lv_int1 - lv_int2.
            WHEN '*'.
                lv_result = lv_int1 * lv_int2.
            WHEN '/'.
                lv_result = lv_int1 / lv_int2.
        ENDCASE.
        DATA(lv_result_out) = |Result: | && lv_result.
        out->write( EXPORTING data = lv_result_out ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
