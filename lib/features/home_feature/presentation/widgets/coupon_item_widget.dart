import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';
import '../../../coupons_feature/data/model/coupon_model.dart';

class HomeCouponItemWidget extends StatelessWidget {
  final CouponModel couponModel;
  const HomeCouponItemWidget({Key? key, required this.couponModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: Res.width*0.97,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red.shade500,
                Colors.red.shade300,
                Colors.red.shade100,
              ]
          ),
          borderRadius: BorderRadius.circular(
              Res.padding),
        ),
        child:
              Stack(
                children:[
                  Positioned(
                      right: -Res.font,
                      top: -Res.font*1.2,
                      child: Container(
                        height: Res.height*0.25,
                        width: Res.width*0.4,
                        decoration: BoxDecoration(
                          color: Colors.red.shade700,
                            shape: BoxShape.circle
                        ),
                      )),
                ListTile(
                    title: Text("name : ${couponModel.couponName!}",style: TextStyle(color: Colors.white,fontSize: Res.font,height:Res.tinyFont*1.5),),
                    subtitle: Text('discount : ${couponModel.couponDiscount!} %',style: TextStyle(color: Colors.white,fontSize: Res.font,height:Res.tinyFont)),
                  ),

             ]
                ),



    );
  }
}
