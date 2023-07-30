import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class CouponTextWidget extends StatelessWidget {
  const CouponTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(top: Res.padding,left: Res.padding),
      child: Row(
        children: [
          Text(
            'Coupons',
            style: Theme.of(context).textTheme.bodyText1!,
          ),
        ],
      )
    );
  }
}
