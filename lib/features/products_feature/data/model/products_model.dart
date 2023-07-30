// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int? productId;
  final String? productName;
  final int? productCategoryId;
  final double? productPrice;
  final double? finalProductPrice;
  final String? productImage;
  final int? productStatus;
  final bool? isFavoriteProduct;

  const  ProductModel({
    this.productId,
    this.productName,
    this.productCategoryId,
    this.productPrice,
    this.finalProductPrice,
    this.productImage,
    this.productStatus,
    this.isFavoriteProduct,
  });

   ProductModel copyWith({
    int? productId,
    String? productName,
    int? productCategoryId,
    double? productPrice,
    double? finalProductPrice,
    String? productImage,
    int? productStatus,
    bool? isFavoriteProduct,
  }) =>
      ProductModel(
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        productPrice: productPrice ?? this.productPrice,
        finalProductPrice: finalProductPrice ?? this.finalProductPrice,
        productImage: productImage ?? this.productImage,
        productStatus: productStatus ?? this.productStatus,
        isFavoriteProduct: isFavoriteProduct ?? this.isFavoriteProduct,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json["product_id"],
    productName: json["product_name"],
    productCategoryId: json["product_category_id"],
    productPrice: json["product_price"]?.toDouble(),
    finalProductPrice: json["final_product_price"]?.toDouble(),
    productImage: json["product_image"],
    productStatus: json["product_status"],
    isFavoriteProduct: json["is_favorite_product"]==1?true:false,
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_category_id": productCategoryId,
    "product_price": productPrice,
    "final_product_price": finalProductPrice,
    "product_image": productImage,
    "product_status": productStatus,
    "is_favorite_product": isFavoriteProduct,
  };
}
