import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/adress_feature/presentation/bloc/address_bloc.dart';
import 'package:shopapp/features/adress_feature/presentation/screens/adress_screen.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../widgets/cart_items_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(GetCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
              color: AppColor.primaryColors,
              fontSize: Res.font * 1.2,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: Res.width,
        height: Res.height,
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (p, c) => p.getCartState != c.getCartState,
          builder: (_, state) {
            if (state.getCartState == States.loading) {
              return errorWidget(state.errorMsg);
            } else if (state.getCartState == States.loaded) {
              return Column(
                children: [
                  BlocConsumer<CartBloc, CartState>(
                    bloc: cartBloc,
                    listener: (_, state) {
                      if (state.removeFromCartState == States.error) {
                        showSnackBar(context, state.errorMsg);
                      }
                    },
                    buildWhen: (p, c) =>
                        p.removeFromCartState != c.removeFromCartState ||
                        p.updateCartState != c.updateCartState,
                    builder: (_, state) => Column(
                      children: [
                        Text(
                          'you have ${state.cart.length} products in your cart',
                          style: TextStyle(
                              height: Res.tinyFont, fontSize: Res.font * 0.9),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Res.font * 0.8),
                          height: Res.height * 0.82,
                          child: RefreshIndicator(
                            child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return CartItemsWidget(
                                    index: index,
                                    cartBloc: cartBloc,
                                    cartModel: state.cart[index],
                                  );
                                },
                                separatorBuilder: (_, index) => SizedBox(
                                      height: Res.font,
                                    ),
                                itemCount: state.cart.length),
                            onRefresh: () async {
                              cartBloc.add(GetCartEvent());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state.getCartState == States.error) {
              return errorWidget(state.errorMsg);
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: MaterialButton(
        height: Res.font * 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Res.padding),
                topRight: Radius.circular(Res.padding))),
        color: AppColor.primaryColors,
        onPressed: () {
          if(cartBloc.state.cart.isEmpty){
            showSnackBar(context,"There is no carts");
          }else{
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => sl<AddressBloc>(),
                  child: const AddressScreen(fromScreen: FromScreen.cart),
                ),
              ),
            );
          }

        },
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: Res.font),
        ),
      ),
    );
  }
}
