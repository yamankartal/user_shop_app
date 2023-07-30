part of 'address_bloc.dart';

class AddressState {
  final States addAddressState;
  final States deleteAddressState;
  final States updateAddressState;
  final States getAddressState;
  final States getAddressDetailsState;
  final AddressDetailsModel addressDetails;
  final List<AddressModel> addresses;
  final States getPositionState;
  final  List<Marker>markers;
  final double long;
  final double lat;
  final ShopAddressModel shopAddressModel;
  final Position ?position;
  final States getShopAddressState;
  final double addressDistance;
  final States getAddressDistanceState;


  AddressState({
    this.getAddressDistanceState=States.init,
    this.addressDistance=0,
    this.getShopAddressState=States.init,
    this.shopAddressModel=const ShopAddressModel(),
    this.position,
    this.long=0, this.lat=0,this.getAddressDetailsState=States.init, this.addressDetails=const AddressDetailsModel(),
    this.markers=const[],
    this.getPositionState=States.init,
      this.addAddressState = States.init,
      this.deleteAddressState = States.init,
      this.updateAddressState = States.init,
      this.getAddressState = States.init,
      this.addresses = const []});

  AddressState copyWith({
    final  List<Marker>?markers,
    final ShopAddressModel ?shopAddressModel,
    final Position ?position,
    final States? getPositionState,
    final States?  getAddressDetailsState,
    final AddressDetailsModel? addressDetails,
    final States? addAddressState,
    final States?  deleteAddressState,
    final States ? updateAddressState,
    final States?  getAddressState,
    final List<AddressModel>?  addresses,
    final double ?long,
    final double ?lat,
    final States ?getShopAddressState,
    final double? addressDistance,
    final States ?getAddressDistanceState,

  }){
  return AddressState(
    markers: markers??this.markers,
    getPositionState: getPositionState??this.getPositionState,
    addAddressState: addAddressState??this.addAddressState,
    deleteAddressState: deleteAddressState??this.deleteAddressState,
    updateAddressState: updateAddressState??this.updateAddressState,
    getAddressState: getAddressState??this.getAddressState,
    addresses: addresses??this.addresses,
    addressDetails: addressDetails??this.addressDetails,
     getAddressDetailsState: getAddressDetailsState??this.getAddressDetailsState,
    lat: lat??this.lat,
    long: long??this.long,
    position: position??this.position,
    shopAddressModel: shopAddressModel??this.shopAddressModel,
    getShopAddressState: getShopAddressState??this.getShopAddressState,
      addressDistance: addressDistance??this.addressDistance,
    getAddressDistanceState: getAddressDistanceState??this.getAddressDistanceState
  );

  }


}
