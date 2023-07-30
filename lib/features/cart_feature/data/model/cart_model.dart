// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  final String? productName;
  final String? productImage;
  final int? productId;
  final int? cartId;
  final int? cartProductQuantity;
  final double? cartProductPrice;



  double totalCartProductPrice(){
    return cartProductQuantity!*cartProductPrice!;
  }

 const CartModel({
    this.productName,
    this.productImage,
    this.productId,
    this.cartId,
    this.cartProductQuantity,
    this.cartProductPrice,
  });

  CartModel copyWith({
    String? productName,
    String? productImage,
    int? productId,
    int? cartId,
    int? cartProductQuantity,
    double? cartProductPrice,
  }) =>
      CartModel(
        productName: productName ?? this.productName,
        productImage: productImage ?? this.productImage,
        productId: productId ?? this.productId,
        cartId: cartId ?? this.cartId,
        cartProductQuantity: cartProductQuantity ?? this.cartProductQuantity,
        cartProductPrice: cartProductPrice ?? this.cartProductPrice,
      );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    productName: json["product_name"],
    productImage: json["product_image"],
    productId: json["product_id"],
    cartId: json["cart_id"],
    cartProductQuantity: json["cart_product_quantity"],
    cartProductPrice: json["cart_product_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "product_image": productImage,
    "product_id": productId,
    "cart_id": cartId,
    "cart_product_quantity": cartProductQuantity,
    "cart_product_price": cartProductPrice,
  };
}
