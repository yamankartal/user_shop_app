import 'package:flutter/cupertino.dart';
import 'package:shopapp/features/checkout_feature/data/model/check_out_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class CheckOutDetailsItemWidget extends StatelessWidget {

    final CheckOutModel checkOutModel;
    final String label;
    final String trailingText;

  const CheckOutDetailsItemWidget({Key? key, required this.checkOutModel, required this.label, required this.trailingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(label,style: TextStyle(fontSize: Res.font,fontWeight: FontWeight.bold,height: Res.tinyFont*1.2),),
        Text(trailingText,style:  TextStyle(color: AppColor.primaryColors,fontSize: Res.font,fontWeight: FontWeight.bold,height: Res.tinyFont*1.2),)
      ],
    );
  }
}
//"${checkOutModel.orderPrice!.roundToDouble()} \$"