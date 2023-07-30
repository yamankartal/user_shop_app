import 'package:flutter/material.dart';
import 'package:shopapp/features/auth_feature/presentation/bloc/auth_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class SignUpWidget extends StatelessWidget {
  final AuthBloc authBloc;

  final TextEditingController userName ;
  final TextEditingController email ;
  final TextEditingController password;
  final TextEditingController phone ;
  final GlobalKey<FormState>formKey;
  const SignUpWidget({Key? key, required this.authBloc, required this.userName, required this.email, required this.password,  required this.phone, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Res.width * 0.75,
      height: Res.font * 1.2,
      textColor: Colors.white,
      color: AppColor.primaryColors,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.font)),
      onPressed: () {
        if(formKey.currentState!.validate()){
          print(0);
          authBloc.add(EventSignUp(email.text, password.text, phone.text, userName.text));
        }
      },
      child: Text(
        "SignUp",
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
