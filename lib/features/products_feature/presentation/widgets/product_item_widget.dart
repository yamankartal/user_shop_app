import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/products_feature/data/model/products_model.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/products_bloc.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  final ProductsBloc productsBloc;
  final int index;

  const ProductItemWidget(
      {Key? key,
      required this.productModel,
      required this.productsBloc,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Res.padding,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(Res.font * 0.7),
                height: Res.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Res.padding),
                        topRight: Radius.circular(Res.padding))),
                child:
                    Image.network("$uploadLink/${productModel.productImage}"),
              ),
              SizedBox(height: Res.padding),
              SizedBox(
                height: Res.font,
                child: Text(
                  productModel.productName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Res.padding),
                height: Res.font * 1.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${productModel.finalProductPrice!.roundToDouble()} \$",
                      style: const TextStyle(color: AppColor.primaryColors),
                    ),
                    BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (_, state) => InkWell(
                        onTap: () {
                          productModel.isFavoriteProduct!
                              ? productsBloc
                                  .add(RemoveProductFromFavoriteEvent(index))
                              : productsBloc
                                  .add(AddProductToFavoriteEvent(index));
                        },
                        child: Icon(
                          productModel.isFavoriteProduct!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppColor.primaryColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
