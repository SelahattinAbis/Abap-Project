@EndUserText.label: 'RAP HandsOn: Booking Suppl. Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZRAPH_SA_C_BookingSuplmentWDTP
  as projection on ZRAPH_SA_I_BookingSupplWDTP
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      @Search.defaultSearchElement: true
      BookingSupplementID,
      @ObjectModel.text.element: ['SupplementDescription']
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_SUPPLEMENT', element: 'SupplementID' } ,
                     additionalBinding: [ { localElement: 'Price',  element: 'Price', usage: #RESULT },
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }] }]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      Price,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZRAPH_SA_C_BookingWDTP,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZRAPH_SA_C_TravelWDTP

}
