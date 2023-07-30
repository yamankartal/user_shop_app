import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/products_bloc.dart';
import '../widgets/decrement_product_quantity_widget.dart';
import '../widgets/increment_product_quantity_widget.dart';
import '../widgets/product_add_to_cart_widget.dart';
import '../widgets/product_description_text_widget.dart';
import '../widgets/product_description_widget.dart';
import '../widgets/product_details_image_widget.dart';
import '../widgets/product_details_name_widget.dart';
import '../widgets/product_quantity_widget.dart';
import '../widgets/products_total_price_widget.dart';
import '../widgets/quantity_available_text_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final FromScreen fromScreen;
  final int productId;
  final int index;
  final int productQuantity;

  const ProductDetailsScreen(
      {Key? key,
      required this.productId,
      required this.index,
      this.productQuantity = 1,
      this.fromScreen = FromScreen.products})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductsBloc productsBloc;
  late CartBloc cartBloc;

  @override
  void initState() {
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    cartBloc = BlocProvider.of<CartBloc>(context);
    productsBloc.add(GetProductDetailsEvent(widget.productId));
    productsBloc.add(SetQuantityProductEvent(widget.productQuantity));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductsBloc, ProductsState>(
          buildWhen: (p, c) =>
              p.getProductDetailsState != c.getProductDetailsState ||
              p.productQuantity != c.productQuantity,
          builder: (_, state) {
            if (state.getProductDetailsState == States.loading) {
              return circularProgressIndicatorWidget();
            } else if (state.getProductDetailsState == States.loaded) {
              final ProductDetailsModel productDetails = state.productDetails;
              return BlocConsumer<CartBloc, CartState>(
                builder: (_, cState) {
                  return SizedBox(
                    width: Res.width,
                    height: Res.fullHeight,
                    child: Column(
                      children: [
                        ProductDetailsImageWidget(
                          productDetailsModel: state.productDetails,
                        ),
                        ProductDetailsNameWidget(
                          productDetailsModel: state.productDetails,
                        ),
                        Container(
                          height: Res.font * 2,
                          margin: EdgeInsets.only(top: Res.font*0.6),
                          padding: EdgeInsets.symmetric(horizontal: Res.font),
                          child: Row(
                            children: [
                              IncrementProductQuantityWidget(
                                productsBloc: productsBloc,
                              ),
                              const ProductQuantityWidget(),
                              DecrementProductQuantityWidget(
                                productsBloc: productsBloc,
                              ),
                              const Spacer(),
                              ProductsTotalPriceWidget(
                                productDetailsModel: productDetails,
                              ),
                            ],
                          ),
                        ),
                        ProductQuantityAvailableTextWidget(
                          productDetails: productDetails,
                        ),
                        ProductDescriptionWidget(
                          productDetails: productDetails,
                        ),
                        const Spacer(),
                        ProductAddToCartWidget(
                          productsBloc: productsBloc,
                            fromScreen: widget.fromScreen,
                            productDetailsModel: productDetails,
                            cartBloc: cartBloc,
                            index: widget.index),
                      ],
                    ),
                  );
                },
                listener: (_, cState) {
                  if (cState.updateCartState == States.loaded) {
                      Navigator.of(context).pop();
    }
                    else if(cState.addToCartState==States.loaded){
                      Navigator.of(context).pop();
                  }
                   else if (cState.updateCartState == States.error ||
                      cState.addToCartState == States.error) {
                    showSnackBar(context, "error");
                  }
                },
              );
            } else if (state.getProductDetailsState == States.error) {
              return errorWidget("error");
            }

            return Container();
          },
        ),
      ),
    );
  }
}
