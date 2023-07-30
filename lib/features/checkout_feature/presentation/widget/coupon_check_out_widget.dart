import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/checkout_bloc.dart';

class CouponCheckOutWidget extends StatelessWidget {
  final TextEditingController coupon;
  final CheckOutBloc checkOutBloc;

  const CouponCheckOutWidget(
      {Key? key, required this.coupon, required this.checkOutBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutBloc, CheckOutState>(
      builder: (_, state) {
        if (state.checkCouponState == States.loaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Res.font),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    height: Res.tinyFont,
                    fontSize: Res.font * 0.9,
                  ),
                  child: Row(
                    children: [
                      const Text('coupon name:  '),
                      Text(
                        coupon.text,
                        style: const TextStyle(color: AppColor.primaryColors),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    checkOutBloc.add(DeleteCouponEvent());
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: AppColor.primaryColors,
                        fontSize: Res.font * 0.9,
                        height: Res.tinyFont),
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: Res.font * 0.7),
          padding: EdgeInsets.symmetric(horizontal: Res.font * 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Res.width * 0.65,
                height: Res.height * 0.06,
                child: Form(
                  key: key,
                  child: TextFormField(
                    style: TextStyle(height:Res.tinyPadding*0.8),
                    cursorColor: Colors.black,
                    controller: coupon,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.primaryColors)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.primaryColors)),
                    ),
                  ),
                ),
              ),
              BlocConsumer<CheckOutBloc, CheckOutState>(
                buildWhen: (p, c) => p.checkCouponState != c.checkCouponState,
                builder: (_, state) {
                  return MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Res.padding * 0.5)),
                    height: Res.height * 0.06,
                    onPressed: () {
                      checkOutBloc.add(CheckCouponEvent(coupon.text));
                    },
                    color: AppColor.primaryColors,
                    minWidth: Res.width * 0.22,
                    child: Text(
                      'apply',
                      style: TextStyle(
                          color: Colors.white, fontSize: Res.font * 0.8),
                    ),
                  );
                },
                listener: (_, state) {
                  if (state.checkCouponState == States.error) {
                    coupon.text = "";
                    showSnackBar(context, " wrong Coupon");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
