@EndUserText.label: 'RAP HandsOn: Booking Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZRAPH_SA_C_BookingWDTP
  as projection on ZRAPH_SA_BookingWDTP
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      BookingID,
      BookingDate,
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]

      CustomerID,
      _Customer.LastName as CustomerName,
      CarrierID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                     additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                          { localElement: 'CarrierID',    element: 'AirlineID'},
                                          { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT},
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      ConnectionID,
      FlightDate,
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                          additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                               { localElement: 'CarrierID',    element: 'AirlineID'},
                                               { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT },
                                               { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      Criticality,
      
       
           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZRAPH_SA_CL_DAYS_TO_FLIGHT'
  virtual  daystoflight : abap.int2,
      
      /* Associations */
      _BookingSupplement : redirected to composition child ZRAPH_SA_C_BookingSuplmentWDTP,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZRAPH_SA_C_TravelWDTP
      
       
}
