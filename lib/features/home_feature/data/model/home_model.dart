// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:shopapp/features/categories_feature/data/model/category_model.dart';
import 'package:shopapp/features/coupons_feature/data/model/coupon_model.dart';

import '../../../products_feature/data/model/products_model.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final List<CategoryModel>? categories;
  final List<ProductModel>? topSellingProducts;
  final List<ProductModel>? offerProducts;
  final List<CouponModel>? coupons;

  const HomeModel({
    this.categories,
    this.topSellingProducts,
    this.offerProducts,
    this.coupons,
  });

  HomeModel copyWith({
    final List<CategoryModel>? categories,
    final List<ProductModel>? topSellingProducts,
    final List<ProductModel>? offerProducts,
    final List<CouponModel>? coupons,
  }) =>
      HomeModel(
        categories: categories ?? this.categories,
        topSellingProducts: topSellingProducts ?? this.topSellingProducts,
        offerProducts: offerProducts ?? this.offerProducts,
        coupons: coupons ?? this.coupons,
      );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    categories: json["categories"] == null ? [] : List<CategoryModel>.from(json["categories"]!.map((x) => CategoryModel.fromJson(x))),
    topSellingProducts: json["top_selling_products"] == null ? [] : List<ProductModel>.from(json["top_selling_products"]!.map((x) => ProductModel.fromJson(x))),
    offerProducts: json["offer_products"] == null ? [] : List<ProductModel>.from(json["offer_products"]!.map((x) => ProductModel.fromJson(x))),
    coupons: json["coupons"] == null ? [] : List<CouponModel>.from(json["coupons"]!.map((x) => CouponModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "top_selling_products": topSellingProducts == null ? [] : List<dynamic>.from(topSellingProducts!.map((x) => x.toJson())),
    "offer_products": offerProducts == null ? [] : List<dynamic>.from(offerProducts!.map((x) => x.toJson())),
    "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x.toJson())),
  };
}



