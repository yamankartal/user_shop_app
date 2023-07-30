// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  final int? couponId;
  final String? couponName;
  final int? couponDiscount;
  final DateTime? couponExpireDate;
  final int? couponCount;

  const CouponModel({
    this.couponId,
    this.couponName,
    this.couponDiscount,
    this.couponExpireDate,
    this.couponCount,
  });


  double couponOrderDiscount(double orderPrice){
    final couponDiscount=this.couponDiscount??0;
    return orderPrice*couponDiscount/100;
  }


  CouponModel copyWith({
    int? couponId,
    String? couponName,
    int? couponDiscount,
    DateTime? couponExpireDate,
    int? couponCount,
  }) =>
      CouponModel(
        couponId: couponId ?? this.couponId,
        couponName: couponName ?? this.couponName,
        couponDiscount: couponDiscount ?? this.couponDiscount,
        couponExpireDate: couponExpireDate ?? this.couponExpireDate,
        couponCount: couponCount ?? this.couponCount,
      );

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    couponId: json["coupon_id"],
    couponName: json["coupon_name"],
    couponDiscount: json["coupon_discount"],
    couponExpireDate: json["coupon_expire_date"] == null ? null : DateTime.parse(json["coupon_expire_date"]),
    couponCount: json["coupon_count"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponId,
    "coupon_name": couponName,
    "coupon_discount": couponDiscount,
    "coupon_expire_date": couponExpireDate?.toIso8601String(),
    "coupon_count": couponCount,
  };
}
