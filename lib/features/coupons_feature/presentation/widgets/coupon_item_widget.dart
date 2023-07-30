import 'package:flutter/material.dart';
import 'package:shopapp/features/coupons_feature/data/model/coupon_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class CouponItemWidget extends StatelessWidget {
  final CouponModel couponModel;

  const CouponItemWidget({Key? key, required this.couponModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.font)
      ),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: Res.font*0.7,vertical: Res.font*0.7),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.black,fontSize: Res.font,height: Res.tinyFont*0.8),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Coupon name : "),
                  Text(couponModel.couponName!,style: const TextStyle(color: AppColor.primaryColors),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("coupon Discount : "),
                  Text("${couponModel.couponDiscount}%",style: const TextStyle(color: AppColor.primaryColors)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Expire date : "),
                  Text("${couponModel.couponExpireDate!.year}/${couponModel.couponExpireDate!.month}/${couponModel.couponExpireDate!.day}",style: const TextStyle(color: AppColor.primaryColors)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Expire time : "),
                  Text("${couponModel.couponExpireDate!.hour}:${couponModel.couponExpireDate!.minute}",style: const TextStyle(color: AppColor.primaryColors)),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}
