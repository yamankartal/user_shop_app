import 'package:flutter/cupertino.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/responsive.dart';

class ProductDetailsNameWidget extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;
  const ProductDetailsNameWidget({Key? key, required this.productDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Res.padding),
      padding: EdgeInsets.only(left: Res.font, top: Res.font),
      child: Row(
        children: [
          Text(
            productDetailsModel.productName!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Res.font),
          ),
        ],
      )
    );
  }
}
