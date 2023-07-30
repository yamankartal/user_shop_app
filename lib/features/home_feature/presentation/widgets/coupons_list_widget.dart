import 'package:flutter/material.dart';
import 'package:shopapp/features/home_feature/data/model/home_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import 'coupon_item_widget.dart';

class CouponsListWidget extends StatelessWidget {
  final HomeModel homeModel;

  const CouponsListWidget({Key? key, required this.homeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Res.font * 0.6),
      height: Res.height * 0.23,
      width: Res.width,
      child: homeModel.coupons != null
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) =>
                  HomeCouponItemWidget(couponModel: homeModel.coupons![index]),
              separatorBuilder: (_, index) => SizedBox(
                    width: Res.padding,
                  ),
              itemCount: homeModel.coupons!.length)
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.red.shade500,
                        Colors.red.shade300,
                        Colors.red.shade100,
                      ]),
                  borderRadius: BorderRadius.circular(Res.font),
                  color: AppColor.primaryColors),
              height: Res.height * 0.22,
              width: Res.width,
              child: Stack(
                children: [
                  Positioned(
                    right: -Res.font,
                    top: -Res.font * 2,
                    child: Container(
                      height: Res.height * 0.3,
                      width: Res.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.red.shade600, shape: BoxShape.circle),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "No active coupons",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Res.font,
                          height: Res.padding * 0.35),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
