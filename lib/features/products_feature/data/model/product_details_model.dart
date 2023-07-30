// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;
  final int? productId;
  final String? productName;
  final String? productDescription;
  final double? productPrice;
  final int? productStatus;
  final int? productCategoryId;
  final int? productQuantity;
  final String? productImage;
  final int? productDiscount;
  final double? finalProductPrice;




  double  totalProductPrice(int productQuantity){
    return finalProductPrice!*productQuantity;
  }


const  ProductDetailsModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.productId,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productStatus,
    this.productCategoryId,
    this.productQuantity,
    this.productImage,
    this.productDiscount,
    this.finalProductPrice,
  });

  ProductDetailsModel copyWith({
    int? categoryId,
    String? categoryName,
    String? categoryImage,
    int? productId,
    String? productName,
    String? productDescription,
    double? productPrice,
    int? productStatus,
    int? productCategoryId,
    int? productQuantity,
    String? productImage,
    int? productDiscount,
    double? finalProductPrice,
  }) =>
      ProductDetailsModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productDescription: productDescription ?? this.productDescription,
        productPrice: productPrice ?? this.productPrice,
        productStatus: productStatus ?? this.productStatus,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        productQuantity: productQuantity ?? this.productQuantity,
        productImage: productImage ?? this.productImage,
        productDiscount: productDiscount ?? this.productDiscount,
        finalProductPrice: finalProductPrice ?? this.finalProductPrice,
      );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    productPrice: json["product_price"]?.toDouble(),
    productStatus: json["product_status"],
    productCategoryId: json["product_category_id"],
    productQuantity: json["product_quantity"],
    productImage: json["product_image"],
    productDiscount: json["product_discount"],
    finalProductPrice: json["final_product_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "product_price": productPrice,
    "product_status": productStatus,
    "product_category_id": productCategoryId,
    "product_quantity": productQuantity,
    "product_image": productImage,
    "product_discount": productDiscount,
    "final_product_price": finalProductPrice,
  };
}

