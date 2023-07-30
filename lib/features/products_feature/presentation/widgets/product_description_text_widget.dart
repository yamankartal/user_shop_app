import 'package:flutter/cupertino.dart';

import '../../../../core/constants/responsive.dart';

class ProductDescriptionTextWidget extends StatelessWidget {
  const ProductDescriptionTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Res.font,vertical: Res.padding),
      child: Row(
        children: [
          Text(
            "Description : ",
            style: TextStyle(
                fontSize: Res.font,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
