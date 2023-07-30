import 'package:flutter/cupertino.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class ProductQuantityAvailableTextWidget extends StatelessWidget {
  final ProductDetailsModel productDetails;
  const ProductQuantityAvailableTextWidget({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: Res.font,vertical: Res.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quantity available : ",
            style: TextStyle(
                fontSize: Res.font,
                fontWeight: FontWeight.bold),
          ),
          Text(
          productDetails.productQuantity.toString(),
            style: TextStyle(
                color: AppColor.primaryColors,
                fontWeight: FontWeight.bold,
                fontSize: Res.font),
          )
        ],
      ),
    );
  }
}
