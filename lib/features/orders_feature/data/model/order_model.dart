// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  final int? orderId;
  final DateTime? orderDateTime;
  final double? orderTotalPrice;
  final int? orderStatus;
  final int? orderRating;

 const OrderModel({
    this.orderId,
    this.orderDateTime,
    this.orderTotalPrice,
    this.orderStatus,
    this.orderRating,
  });

  OrderModel copyWith({
    int? orderId,
    DateTime? orderDateTime,
    double? orderTotalPrice,
    int? orderStatus,
    int? orderRating,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        orderDateTime: orderDateTime ?? this.orderDateTime,
        orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice,
        orderStatus: orderStatus ?? this.orderStatus,
        orderRating: orderRating ?? this.orderRating,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json["order_id"],
    orderDateTime: json["order_date_time"] == null ? null : DateTime.parse(json["order_date_time"]),
    orderTotalPrice: json["order_total_price"]?.toDouble(),
    orderStatus: json["order_status"],
    orderRating: json["order_rating"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_date_time": orderDateTime?.toIso8601String(),
    "order_total_price": orderTotalPrice,
    "order_status": orderStatus,
    "order_rating": orderRating,
  };
}
