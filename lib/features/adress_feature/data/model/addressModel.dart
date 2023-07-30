// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  final int? addressId;
  final String? addressCity;
  final String? addressStreet;

 const  AddressModel({
    this.addressId,
    this.addressCity,
    this.addressStreet,
  });

  AddressModel copyWith({
    int? addressId,
    String? addressCity,
    String? addressStreet,
  }) =>
      AddressModel(
        addressId: addressId ?? this.addressId,
        addressCity: addressCity ?? this.addressCity,
        addressStreet: addressStreet ?? this.addressStreet,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    addressId: json["address_id"],
    addressCity: json["address_city"],
    addressStreet: json["address_street"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "address_city": addressCity,
    "address_street": addressStreet,
  };
}
