CLASS zcl_sa_main_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sa_main_airplane IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA l_carrier TYPE REF TO lcl_carrier.
    DATA l_rental1 TYPE REF TO lcl_rental.
    DATA l_rental2 TYPE REF TO lcl_rental.
    DATA l_travel_agency TYPE REF TO lcl_travel_agency.
    DATA l_basic_airplane TYPE REF TO local_airplane.
    DATA l_cargo_plane TYPE REF TO lcl_cargo_plane.
    DATA l_passenger_plane TYPE REF TO lcl_passenger_plane.

* Creating carrier with airplanes
    l_carrier = NEW #( 'WEFEL - We fly everything lines' ).

    l_basic_airplane = NEW #( im_name = 'Basic Plane' im_planetype = 'Boeing' ).
*    l_carrier->add_airplane( l_basic_airplane ).

    l_cargo_plane = NEW #( im_name = 'Cargo Plane' im_planetype = 'Boeing' im_max_cargo = 1000 ).
*    l_carrier->add_airplane( l_cargo_plane ).

    l_passenger_plane = NEW #( im_name = 'Passenger Plane' im_planetype = 'Airbus'  im_max_seats = 500 ).
*    l_carrier->add_airplane( l_passenger_plane ).

* Creating two rentals
    l_rental1 = NEW lcl_rental( 'Rental 1' ).
    l_rental2 = NEW lcl_rental( 'Rental 2' ).

* Creating travel agency and adding partners
    l_travel_agency = NEW #( 'my travel agency' ).
    l_travel_agency->add_partner( l_carrier ).
    l_travel_agency->add_partner( l_rental1 ).
    l_travel_agency->add_partner( l_rental2 ).

* Checking the result
    l_travel_agency->display_agency_partners( out ).








  ENDMETHOD.
ENDCLASS.
