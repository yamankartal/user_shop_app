import 'package:flutter/cupertino.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/responsive.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final ProductDetailsModel productDetails;

  const ProductDescriptionWidget({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Res.font),
      padding: EdgeInsets.symmetric(horizontal: Res.font),
      height: Res.height * 0.25,
      child: ListView(
        children: [
          Text(
            productDetails.productDescription!,
            textAlign: TextAlign.center,
            style: TextStyle(height: Res.tinyFont*0.7, fontSize: Res.font,),

          ),
        ],
      ),
    );
  }
}
