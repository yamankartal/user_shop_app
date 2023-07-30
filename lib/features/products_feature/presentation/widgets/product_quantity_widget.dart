import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/products_bloc.dart';

class ProductQuantityWidget extends StatelessWidget {
  const ProductQuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductsBloc, ProductsState>(
      builder: (_, state) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: Res.padding * 0.5),
        height: Res.font * 1.2,
        width: Res.font * 2.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black87)),
        child: Text(
          state.productQuantity.toString(),
          style: TextStyle(
              fontSize: Res.font,
              color: AppColor.primaryColors),
        ),
      ),
    );
  }
}
