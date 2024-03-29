CLASS zabap010_sa_get_start_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZABAP010_SA_GET_START_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES:
    BEGIN OF lst_travel_info,
        travel_id TYPE /dmo/travel_id,
        agency_id TYPE /dmo/agency_id,
        customer_id TYPE /dmo/customer_id,
        begin_date TYPE /dmo/begin_date,
        end_date TYPE /dmo/end_date,
        dayamount TYPE i,
    END OF lst_travel_info .
  DATA lv_travel_id TYPE /dmo/travel_id.
  DATA ls_travel TYPE /dmo/travel.
  DATA ls_travel_info TYPE lst_travel_info.
  lv_travel_id = '00000007'.
  SELECT SINGLE * FROM /dmo/travel
     WHERE travel_id = @lv_travel_id
     INTO @ls_travel.
     MOVE-CORRESPONDING ls_travel TO ls_travel_info.

  ENDMETHOD.
ENDCLASS.
