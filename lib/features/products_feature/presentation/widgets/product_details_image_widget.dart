import 'package:flutter/cupertino.dart';
import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/responsive.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;

  const ProductDetailsImageWidget({Key? key, required this.productDetailsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Res.padding),
      height: Res.height * 0.45,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "$uploadLink/${productDetailsModel.productImage}",
          ),
        ),
      ),
    );
  }
}
