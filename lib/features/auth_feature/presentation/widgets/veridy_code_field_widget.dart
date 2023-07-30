import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shopapp/features/auth_feature/presentation/bloc/auth_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class VerifyCodeWidget extends StatelessWidget {
  const VerifyCodeWidget({Key? key, required this.authBloc, required this.email}) : super(key: key);
final AuthBloc authBloc;
final String email;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      borderColor: AppColor.primaryColors,
      cursorColor: Colors.black,
      enabledBorderColor: AppColor.primaryColors,
      focusedBorderColor: AppColor.primaryColors,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(Res.font),
      onSubmit: (String verificationCode) {
        authBloc.add(EventVerifyCode(int.parse(verificationCode),email));
      }, // end onSubmit
    );
  }
}
