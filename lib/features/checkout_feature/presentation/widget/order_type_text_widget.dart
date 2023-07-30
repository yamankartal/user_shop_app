import 'package:flutter/cupertino.dart';

import '../../../../core/constants/responsive.dart';

class OrderTypeTextWidget extends StatelessWidget {
  const OrderTypeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.only(left: Res.font*1.5),
      child: Row(
        children: [
        Text("order type",style: TextStyle(height: Res.tinyFont,fontSize: Res.font)),
        ],
      ),
    );
  }
}
