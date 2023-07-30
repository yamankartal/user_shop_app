import 'package:flutter/material.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../../../products_feature/data/model/products_model.dart';

class HomeProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const HomeProductItemWidget({Key? key, required this.productModel})
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
                width: Res.width * 0.6,
                height: Res.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "$uploadLink/${productModel.productImage}",
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Res.padding),
                    topRight: Radius.circular(Res.padding),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:Res.padding*0.2),
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productModel.productName!,
                      style: TextStyle(
                          fontSize: Res.font,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: Res.padding,),
                    Text(
                      "${productModel.finalProductPrice!.roundToDouble()} \$",
                      style: TextStyle(
                          color: AppColor.primaryColors, fontSize: Res.font),
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
