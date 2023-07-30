// To parse this JSON data, do
//
//     final addressDetailsModel = addressDetailsModelFromJson(jsonString);

import 'dart:convert';

AddressDetailsModel addressDetailsModelFromJson(String str) => AddressDetailsModel.fromJson(json.decode(str));

String addressDetailsModelToJson(AddressDetailsModel data) => json.encode(data.toJson());

class AddressDetailsModel {
  final int? addressId;
  final String? addressCity;
  final String? addressStreet;
  final double? addressLat;
  final double? addressLong;
  final String? addressDetails;
  final String? addressFloor;
  final int? addressStatus;
  final int? addressUserId;
  final int? addressPhone;

 const AddressDetailsModel({
    this.addressId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressDetails,
    this.addressFloor,
    this.addressStatus,
    this.addressUserId,
    this.addressPhone,
  });

  AddressDetailsModel copyWith({
    int? addressId,
    String? addressCity,
    String? addressStreet,
    double? addressLat,
    double? addressLong,
    String? addressDetails,
    String? addressFloor,
    int? addressStatus,
    int? addressUserId,
    int? addressPhone,
  }) =>
      AddressDetailsModel(
        addressId: addressId ?? this.addressId,
        addressCity: addressCity ?? this.addressCity,
        addressStreet: addressStreet ?? this.addressStreet,
        addressLat: addressLat ?? this.addressLat,
        addressLong: addressLong ?? this.addressLong,
        addressDetails: addressDetails ?? this.addressDetails,
        addressFloor: addressFloor ?? this.addressFloor,
        addressStatus: addressStatus ?? this.addressStatus,
        addressUserId: addressUserId ?? this.addressUserId,
        addressPhone: addressPhone ?? this.addressPhone,
      );

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) => AddressDetailsModel(
    addressId: json["address_id"],
    addressCity: json["address_city"],
    addressStreet: json["address_street"],
    addressLat: json["address_lat"]?.toDouble(),
    addressLong: json["address_long"]?.toDouble(),
    addressDetails: json["address_details"],
    addressFloor: json["address_floor"],
    addressStatus: json["address_status"],
    addressUserId: json["address_user_id"],
    addressPhone: json["address_phone"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "address_city": addressCity,
    "address_street": addressStreet,
    "address_lat": addressLat,
    "address_long": addressLong,
    "address_details": addressDetails,
    "address_floor": addressFloor,
    "address_status": addressStatus,
    "address_user_id": addressUserId,
    "address_phone": addressPhone,
  };
}
