import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';

class SignInButtonWidget extends StatelessWidget {
 final AuthBloc authBloc;
 final TextEditingController email;
 final TextEditingController password;
 final GlobalKey<FormState> formKey;

  const SignInButtonWidget({Key? key, required this.authBloc, required this.formKey, required this.email, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
        minWidth: Res.width*0.8,
        height: Res.font*1.2,
        textColor: Colors.white,
        color: AppColor.primaryColors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Res.font)),
        onPressed: () {
          print(email.text);
          print(password.text);
          if(formKey.currentState!.validate()){
            authBloc.add(EventSignIn(email.text,password.text));
          }
        },
        child:  Text("SignIn",style: Theme.of(context).textTheme.headline4,),
    );
  }
}
