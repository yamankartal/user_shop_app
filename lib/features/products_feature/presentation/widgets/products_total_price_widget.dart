import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/products_bloc.dart';

class ProductsTotalPriceWidget extends StatelessWidget {
  final  ProductDetailsModel productDetailsModel;
  const ProductsTotalPriceWidget({Key? key, required this.productDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (_, state) => Text(
        "${state.productDetails.totalProductPrice(state.productQuantity).roundToDouble()} \$",
        style: TextStyle(
            color: AppColor.primaryColors,
            fontSize: Res.font,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
