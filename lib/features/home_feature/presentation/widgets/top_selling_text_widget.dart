import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class TopSellingTextWidget extends StatelessWidget {
  const TopSellingTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: Res.padding,left: Res.padding),
      child:Row(
        children: [
          Text(
            'Top selling',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      )
    );
  }
}
