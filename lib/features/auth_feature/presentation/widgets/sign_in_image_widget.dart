import 'package:flutter/cupertino.dart';

import '../../../../core/constants/responsive.dart';

class SignInImageWidget extends StatelessWidget {
  const SignInImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: Res.padding,bottom: Res.padding),
      width: Res.width * 0.45,
      height: Res.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Res.height * 0.5),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/logoapp.png'),
        ),
      ),
    );
  }
}
