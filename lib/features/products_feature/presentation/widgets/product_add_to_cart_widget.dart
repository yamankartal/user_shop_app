import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/enums.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../../../cart_feature/presentation/bloc/cart_bloc.dart';

class ProductAddToCartWidget extends StatelessWidget {
  final FromScreen fromScreen;
  final CartBloc cartBloc;
  final ProductsBloc productsBloc;
  final int index;
  final ProductDetailsModel productDetailsModel;

  const ProductAddToCartWidget({
    Key? key,
    required this.fromScreen,
    required this.cartBloc,
    required this.index,
    required this.productDetailsModel, required this.productsBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: Res.font * 1.2, left: Res.font * 1.2, bottom: Res.font * 0.6),
      child: BlocListener<CartBloc, CartState>(
        listener: (_, state) {
          if (state.addToCartState == States.loaded) {
            Navigator.of(context).pop();
          }
        },
        listenWhen: (p, c) => p.addToCartState != c.addToCartState,
        child: MaterialButton(
          minWidth: Res.width * 0.8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Res.padding)),
          color: AppColor.primaryColors,
          height: Res.font * 1.4,
          onPressed: () {
            if (fromScreen == FromScreen.cart) {
              cartBloc.add(
                UpdateCartEvent(
                  index,
                  productsBloc.state.productQuantity,
                ),
              );
            } else if (fromScreen == FromScreen.products) {
              cartBloc.add(AddToCartEvent(
                  productDetailsModel.productId!,
                  productsBloc.state.productQuantity,
                  productDetailsModel.finalProductPrice!));
            }
          },
          child: Text(
            fromScreen == FromScreen.cart ? 'Update cart' : 'Add to cart',
            style: TextStyle(color: Colors.white, fontSize: Res.font),
          ),
        ),
      ),
    );
  }
}
