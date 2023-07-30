import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/sign_in_screen.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/verify_code_screen.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_up_form_sidget.dart';
import '../widgets/sign_up_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthBloc authBloc;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
      ),
      body: SizedBox(
        width: Res.width,
        height: Res.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.primaryColors, fontSize: Res.font * 1.4),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Res.font),
                padding: EdgeInsets.symmetric(horizontal: Res.padding * 1.5),
                child: Text(
                  'Sign in with your email and password or continue with existing account',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: Res.tinyFont * 0.8),
                  textAlign: TextAlign.center,
                ),
              ),
              SignUpFormWidget(
                authBloc: authBloc,
                confirmPassword: confirmPassword,
                email: email,
                formKey: key,
                password: password,
                phone: phone,
                userName: userName,
              ),
              SizedBox(
                height: Res.font,
              ),
              BlocListener<AuthBloc, AuthState>(
                bloc: authBloc,
                listener: (context, state) {
                  if (state.signUpState == States.loaded) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => sl<AuthBloc>(),
                          child: VerifyCodeScreen(
                            fromScreen: FromScreen.signUp,
                            email: email.text,
                          ),
                        ),
                      ),
                    );
                  } else if (state.signUpState == States.error) {
                    showSnackBar(context,state.errorMsg);
                  }
                },
                // listenWhen: (p, c) => p.signUpState != c.signUpState,
                child: SignUpWidget(authBloc:authBloc,email: email,password: password,userName: userName,phone: phone, formKey: key,),
              ),
              SizedBox(height: Res.font,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' You have not an  account?',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => sl<AuthBloc>(),
                            child: const SignInScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      ' SignIn ',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColor.primaryColors,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
