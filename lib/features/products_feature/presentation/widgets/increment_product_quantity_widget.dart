import 'package:flutter/material.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class DecrementProductQuantityWidget extends StatelessWidget {
  final  ProductsBloc productsBloc;
  const DecrementProductQuantityWidget({Key? key, required this.productsBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(Res.font),
      onTap: () {
        productsBloc.add(DecreaseProductQuantityEvent());
      },
      child: Icon(
        Icons.remove,
        size: Res.font * 1.6,
        color: AppColor.primaryColors,
      ),
    );
  }
}
