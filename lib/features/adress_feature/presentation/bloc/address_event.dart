part of 'address_bloc.dart';

abstract class AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final String addressCity;
  final String addressStreet;
  final String addressDetails;
  final String addressFloor;
  final int addressPhone;
  final double addressDistance;

  AddAddressEvent(
      {
        required this.addressDistance,
        required this.addressPhone,
      required this.addressCity,
      required this.addressStreet,
      required this.addressDetails,
      required this.addressFloor});
}

class DeleteAddressEvent extends AddressEvent {
  final int index;

  DeleteAddressEvent(this.index);
}

class UpdateAddressEvent extends AddressEvent {
  final int addressId;
  final String addressCity;
  final String addressStreet;
  final String addressDetails;
  final String addressFloor;
  final int addressPhone;
  final int index;

  UpdateAddressEvent({required this.addressId,
required this.addressPhone,
    required    this.index,

        required   this.addressCity,
        required   this.addressStreet,
        required  this.addressDetails,
        required  this.addressFloor});
}

class GetAddressesEvent extends AddressEvent {}

class GetAddressDetailsEvent extends AddressEvent{
  final int addressId;
  GetAddressDetailsEvent(this.addressId);
}

class GetPositionEvent extends AddressEvent {}

class AddMarkerEvent extends AddressEvent {
  final LatLng latLng;

  AddMarkerEvent(this.latLng);
}

class InitMarkersEvent extends AddressEvent{

}

class GetAddressDistanceEvent extends AddressEvent{
  final double lat;
  final double long;
  final double shopLat;
  final double shopLong;
  GetAddressDistanceEvent(this.lat, this.long, this.shopLat, this.shopLong);
}

class GetShopAddressEvent extends AddressEvent{}

