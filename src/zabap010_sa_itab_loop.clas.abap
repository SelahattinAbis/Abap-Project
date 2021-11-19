CLASS zabap010_sa_itab_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZABAP010_SA_ITAB_LOOP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_flight TYPE /dmo/t_flight.
    DATA ls_flight TYPE /dmo/flight.

    SELECT * FROM /dmo/flight INTO TABLE @lt_flight.

    LOOP AT lt_flight INTO ls_flight.
        out->write( EXPORTING data = ls_flight ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
