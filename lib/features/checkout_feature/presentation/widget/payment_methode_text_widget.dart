import 'package:flutter/cupertino.dart';

import '../../../../core/constants/responsive.dart';

class OrderPaymentMethodeTextWidget extends StatelessWidget {
  const OrderPaymentMethodeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.only(left: Res.font*1.5),
      child: Row(
        children: [
          Text("payment methode",style: TextStyle(fontSize: Res.font,height: Res.tinyFont*0.8),)
        ],
      ),
    );
  }
}
