import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home_feature/presentation/widgets/home_product_item_widget.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../cart_feature/presentation/bloc/cart_bloc.dart';
import '../../../products_feature/data/model/products_model.dart';
import '../../../products_feature/presentation/bloc/products_bloc.dart';
import '../../../products_feature/presentation/screens/product_details_screen.dart';
import '../../../products_feature/presentation/widgets/product_item_widget.dart';

class OfferProductsListWidget extends StatelessWidget {
  final List<ProductModel> offers;

  const OfferProductsListWidget({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Res.padding),
      height: Res.height * 0.27,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(providers: [
                      BlocProvider(create: (_) => sl<ProductsBloc>()),
                      BlocProvider(create: (_) => sl<CartBloc>()),
                    ], child: ProductDetailsScreen(
                      fromScreen: FromScreen.products,
                        productId: offers[index].productId!,
                        index: index),
                    ),
                  ),
                );
              },
              child: HomeProductItemWidget(productModel: offers[index],)
          ),
          separatorBuilder: (_, index) => SizedBox(
                width: Res.padding,
              ),
          itemCount: offers.length),
    );
  }
}
