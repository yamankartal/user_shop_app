import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class CheckEmailTextWidget extends StatelessWidget {
  const CheckEmailTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Check Email',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: Res.font * 2),
    );
  }
}
