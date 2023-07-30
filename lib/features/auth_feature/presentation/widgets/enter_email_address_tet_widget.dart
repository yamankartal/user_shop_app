import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class EnterEmailAddressTextWidget extends StatelessWidget {
  const EnterEmailAddressTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Res.padding * 1.5),
      child: Text(
        'Please enter your email address to receive a verification code',
        style: Theme.of(context).textTheme.headline5!.copyWith(
            height: Res.tinyFont * 0.7, color: Colors.black45),
        textAlign: TextAlign.center,
      ),
    );
  }
}
