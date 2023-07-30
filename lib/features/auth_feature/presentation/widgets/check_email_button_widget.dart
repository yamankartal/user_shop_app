import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/widgets.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../screens/verify_code_screen.dart';

class CheckEmailButtonWidget extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState>formKey;
  final AuthBloc authBloc;
  const CheckEmailButtonWidget({Key? key, required this.email, required this.formKey, required this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (p, c) =>
      p.checkEmailState != c.checkEmailState,
      listener: (context, state) {

        if(state.checkEmailState==States.loaded) {
          Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => sl<AuthBloc>(),
              child: VerifyCodeScreen(
                fromScreen: FromScreen.forgetPassword,

                email: email.text,
              ),
            ),
          ),
        );
        }
        else if(state.checkEmailState==States.error){
          showSnackBar(context, state.errorMsg);
        }
      },
      child: Container(
        width: Res.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: Res.font * 0.9),
        child: MaterialButton(
          height: Res.font * 1.2,
          textColor: Colors.white,
          color: AppColor.primaryColors,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Res.font)),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              authBloc.add(EventCheckEmail(email.text));
            }
          },
          child: Text(
            "Check",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
