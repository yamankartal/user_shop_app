// To parse this JSON data, do
//
//     final shopAddressModel = shopAddressModelFromJson(jsonString);

import 'dart:convert';

ShopAddressModel shopAddressModelFromJson(String str) => ShopAddressModel.fromJson(json.decode(str));

String shopAddressModelToJson(ShopAddressModel data) => json.encode(data.toJson());

class ShopAddressModel {
  final double? shopLat;
  final double? shopLong;

const  ShopAddressModel({
    this.shopLat,
    this.shopLong,
  });

  ShopAddressModel copyWith({
    double? shopLat,
    double? shopLong,
  }) =>
      ShopAddressModel(
        shopLat: shopLat ?? this.shopLat,
        shopLong: shopLong ?? this.shopLong,
      );

  factory ShopAddressModel.fromJson(Map<String, dynamic> json) => ShopAddressModel(
    shopLat: json["shop_lat"]?.toDouble(),
    shopLong: json["shop_long"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "shop_lat": shopLat,
    "shop_long": shopLong,
  };
}
