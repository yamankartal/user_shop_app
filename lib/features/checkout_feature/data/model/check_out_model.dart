// To parse this JSON data, do
//
//     final checkOutModel = checkOutModelFromJson(jsonString);

import 'dart:convert';

CheckOutModel checkOutModelFromJson(String str) => CheckOutModel.fromJson(json.decode(str));

String checkOutModelToJson(CheckOutModel data) => json.encode(data.toJson());

class CheckOutModel {
  final double? orderPrice;
  final double? orderDeliveryPrice;


  double totalOrderPrice(int couponDiscount,int orderType){
    return (orderPrice!-orderPrice!*couponDiscount/100)+orderDeliveryPrice!;
  }



 const CheckOutModel({
    this.orderPrice,
    this.orderDeliveryPrice,
  });

  CheckOutModel copyWith({
    double? orderPrice,
    double? orderDeliveryPrice,
  }) =>
      CheckOutModel(
        orderPrice: orderPrice ?? this.orderPrice,
        orderDeliveryPrice: orderDeliveryPrice ?? this.orderDeliveryPrice,
      );

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
    orderPrice: json["order_price"]?.toDouble(),
    orderDeliveryPrice: json["order_delivery_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "order_price": orderPrice,
    "order_delivery_price": orderDeliveryPrice,
  };
}

