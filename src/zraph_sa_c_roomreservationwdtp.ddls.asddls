@EndUserText.label: 'RAP HandsOn: Room Reservation Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZRAPH_SA_C_RoomReservationWDTP
  as projection on ZRAPH_SA_I_RoomReservationWDTP
{
  key RoomRsvUUID,

      TravelUUID,

      RoomRsvID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['HotelName']
      @Consumption.valueHelpDefinition: [ {entity: {name: 'ZRAPH_I_HOTEL', element: 'HotelID' } } ]
      HotelID,
      _Hotel.Name as HotelName,
      
      _Hotel.City as City,

      BeginDate,

      EndDate,

      @Consumption.valueHelpDefinition: [{ entity: { name:    'ZRAPH_I_HotelRoomType',
                                                     element: 'Value'  } }]
      @ObjectModel.text.element: ['RoomTypeText']
      @Search.defaultSearchElement: true
      RoomType,
      _HotelRoomType.Text as RoomTypeText,

      RoomRsvPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,

      LocalLastChangedAt,
      
      /* Associations */
      _Hotel,
      _HotelRoomType,
      _Travel : redirected to parent ZRAPH_SA_C_TravelWDTP
}
