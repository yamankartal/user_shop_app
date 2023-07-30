// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

import '../../../coupons_feature/data/model/coupon_model.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final OrderDetails? orderDetails;
  final CouponModel? orderCoupon;
  final List<OrderItem>? orderItems;

  const OrderDetailsModel({
    this.orderDetails,
    this.orderCoupon,
    this.orderItems,
  });

  OrderDetailsModel copyWith({
    OrderDetails? orderDetails,
    CouponModel? orderCoupon,
    List<OrderItem>? orderItems,
  }) =>
      OrderDetailsModel(
        orderDetails: orderDetails ?? this.orderDetails,
        orderCoupon: orderCoupon ?? this.orderCoupon,
        orderItems: orderItems ?? this.orderItems,
      );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    orderDetails: json["order_details"] == null ? null : OrderDetails.fromJson(json["order_details"]),
    orderCoupon: json["order_coupon"] == null ? null : CouponModel.fromJson(json["order_coupon"]),
    orderItems: json["order_items"] == null ? [] : List<OrderItem>.from(json["order_items"]!.map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_details": orderDetails?.toJson(),
    "order_coupon": orderCoupon?.toJson(),
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
  };
}


class OrderDetails {
  final int? orderId;
  final DateTime? orderDateTime;
  final int? orderStatus;
  final double? orderPrice;
  final int? orderDeliveryPrice;
  final int? orderType;
  final int? orderPaymentMethode;
  final int? orderRating;
  final String? orderComment;
  final double? orderTotalPrice;
  final String? addressCity;
  final String? addressStreet;
  final double? addressLat;
  final double? addressLong;
  final int? addressId;

  OrderDetails({
    this.orderId,
    this.orderDateTime,
    this.orderStatus,
    this.orderPrice,
    this.orderDeliveryPrice,
    this.orderType,
    this.orderPaymentMethode,
    this.orderRating,
    this.orderComment,
    this.orderTotalPrice,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressId,
  });

  OrderDetails copyWith({
    int? orderId,
    DateTime? orderDateTime,
    int? orderStatus,
    double? orderPrice,
    int? orderDeliveryPrice,
    int? orderType,
    int? orderPaymentMethode,
    int? orderRating,
    String? orderComment,
    double? orderTotalPrice,
    String? addressCity,
    String? addressStreet,
    double? addressLat,
    double? addressLong,
    int? addressId,
  }) =>
      OrderDetails(
        orderId: orderId ?? this.orderId,
        orderDateTime: orderDateTime ?? this.orderDateTime,
        orderStatus: orderStatus ?? this.orderStatus,
        orderPrice: orderPrice ?? this.orderPrice,
        orderDeliveryPrice: orderDeliveryPrice ?? this.orderDeliveryPrice,
        orderType: orderType ?? this.orderType,
        orderPaymentMethode: orderPaymentMethode ?? this.orderPaymentMethode,
        orderRating: orderRating ?? this.orderRating,
        orderComment: orderComment ?? this.orderComment,
        orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice,
        addressCity: addressCity ?? this.addressCity,
        addressStreet: addressStreet ?? this.addressStreet,
        addressLat: addressLat ?? this.addressLat,
        addressLong: addressLong ?? this.addressLong,
        addressId: addressId ?? this.addressId,
      );

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orderId: json["order_id"],
    orderDateTime: json["order_date_time"] == null ? null : DateTime.parse(json["order_date_time"]),
    orderStatus: json["order_status"],
    orderPrice: json["order_price"]?.toDouble(),
    orderDeliveryPrice: json["order_delivery_price"],
    orderType: json["order_type"],
    orderPaymentMethode: json["order_payment_methode"],
    orderRating: json["order_rating"],
    orderComment: json["order_comment"],
    orderTotalPrice: json["order_total_price"]?.toDouble(),
    addressCity: json["address_city"],
    addressStreet: json["address_street"],
    addressLat: json["address_lat"]?.toDouble(),
    addressLong: json["address_long"]?.toDouble(),
    addressId: json["address_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_date_time": orderDateTime?.toIso8601String(),
    "order_status": orderStatus,
    "order_price": orderPrice,
    "order_delivery_price": orderDeliveryPrice,
    "order_type": orderType,
    "order_payment_methode": orderPaymentMethode,
    "order_rating": orderRating,
    "order_comment": orderComment,
    "order_total_price": orderTotalPrice,
    "address_city": addressCity,
    "address_street": addressStreet,
    "address_lat": addressLat,
    "address_long": addressLong,
    "address_id": addressId,
  };
}

class OrderItem {
  final String? productName;
  final int? cartProductQuantity;
  final double? cartProductPrice;

  OrderItem({
    this.productName,
    this.cartProductQuantity,
    this.cartProductPrice,
  });

  OrderItem copyWith({
    String? productName,
    int? cartProductQuantity,
    double? cartProductPrice,
  }) =>
      OrderItem(
        productName: productName ?? this.productName,
        cartProductQuantity: cartProductQuantity ?? this.cartProductQuantity,
        cartProductPrice: cartProductPrice ?? this.cartProductPrice,
      );

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productName: json["product_name"],
    cartProductQuantity: json["cart_product_quantity"],
    cartProductPrice: json["cart_product_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "cart_product_quantity": cartProductQuantity,
    "cart_product_price": cartProductPrice,
  };
}
