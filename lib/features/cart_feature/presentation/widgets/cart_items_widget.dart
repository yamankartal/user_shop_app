import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/cart_feature/data/model/cart_model.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/screens/product_details_screen.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';

class CartItemsWidget extends StatelessWidget {
  final CartBloc cartBloc;
  final CartModel cartModel;
  final int index;

  const CartItemsWidget(
      {Key? key,
      required this.cartBloc,
      required this.cartModel,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<ProductsBloc>(),
                ),
                BlocProvider.value(
                  value: cartBloc,
                ),
              ],
              child: ProductDetailsScreen(
                productId: cartModel.productId!,
                index: index,
                fromScreen: FromScreen.cart,
                productQuantity: cartModel.cartProductQuantity!,
              ),
            ),
          ),
        );
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Are you sure you want to delete this product ?",
                      style:
                          TextStyle(color: Colors.black, fontSize: Res.font)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                              color: AppColor.primaryColors,
                              fontSize: Res.font * 0.8),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          cartBloc.add(RemoveFromCartEvent(index));
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: AppColor.primaryColors,
                              fontSize: Res.font * 0.8),
                        )),
                  ],
                ));
      },
      child: SizedBox(
        height: Res.height * 0.1,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: Res.font * 0.8),
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Res.padding)),
          child: Row(
            children: [
              Container(
                width: Res.width * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //fit: BoxFit.cover,
                        image: NetworkImage(
                            "$uploadLink/${cartModel.productImage}"))),
              ),
              SizedBox(
                width: Res.width * 0.4,
                child: ListTile(
                  title: Text(cartModel.productName.toString()),
                  subtitle: Text(
                    "${cartModel.totalCartProductPrice().roundToDouble()} \$",
                    style: const TextStyle(
                        height: 2, color: AppColor.primaryColors),
                  ),
                ),
              ),
              Text(cartModel.cartProductQuantity.toString())
            ],
          ),
        ),
      ),
    );
  }
}
