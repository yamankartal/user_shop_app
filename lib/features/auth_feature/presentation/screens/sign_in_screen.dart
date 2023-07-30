import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/sign_up_screen.dart';
import 'package:shopapp/features/home_page_feature/presentation/bloc/home_page_bloc.dart';
import 'package:shopapp/features/home_page_feature/presentation/screens/home_page.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../components/text_form_fieldWidget.dart';
import '../../validate/validate.dart';
import '../bloc/auth_bloc.dart';
import '../screens/verify_code_screen.dart';
import '../widgets/sign_in_button_widget.dart';
import '../widgets/sign_in_image_widget.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late AuthBloc authBloc;

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
        backgroundColor: Colors.white10,
      ),
      body: Container(
        color: Colors.white10,
        width: Res.width,
        height: Res.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Text('Sign in',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            const SignInImageWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Res.padding * 1.5),
              child: Text(
                'Sign in with your email and password or continue with social media',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Res.font,
            ),
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    textEditingController: email,
                    label: 'Email',
                    hint: 'Enter your email',
                    iconData: Icons.email_outlined,
                    validate: (String? val) {
                      return validate(
                        max: 20,
                        min: 10,
                        type: Auth.email,
                        val: val,
                      );
                    },
                  ),
                  BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                    return TextFormFieldWidget(
                      hidePassword: state.hidePassword,
                      validate: (String? val) {
                        return validate(
                            max: 20, min: 10, type: Auth.password, val: val);
                      },
                      label: 'Password',
                      hint: "Enter your password",
                      textEditingController: password,
                      onTap: () {
                        authBloc.add(EventPasswordVisibility());
                      },
                      iconData: state.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    );
                  }),
                  SizedBox(
                    height: Res.font,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_)=>sl<AuthBloc>(),
                    child: const ForgetPasswordScreen(
                        fromScreen: FromScreen.forgetPassword),
                  ),
                ),);
              },
              child: Container(
                width: Res.width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: Res.padding),
                child: Text(
                  'Forget password ?',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            SizedBox(
              height: Res.padding,
            ),
            BlocListener<AuthBloc, AuthState>(
              bloc: authBloc,
              listener: (_, state) {
                if (state.signInState == States.loaded) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (_) => sl<HomePageBloc>(),
                              child: const HomePage(),
                            )),
                  );
                } else if (state.signInState == States.error) {
                  if (state.errorMsg == "0") {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "You already have this account \nbut need to be verified",style: TextStyle(fontSize: Res.font*0.8,height: Res.tinyFont*0.8),),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "cancel",
                                style: TextStyle(
                                    color: AppColor.primaryColors,
                                    fontSize: Res.font*0.8),
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
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
                            },
                            child: Text(
                              "verify",
                              style: TextStyle(
                                  color: AppColor.primaryColors,
                                  fontSize: Res.font*0.8),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showSnackBar(context, state.errorMsg);
                  }
                }
              },
              listenWhen: (p, c) => p.signInState != c.signInState,
              child: SignInButtonWidget(
                authBloc: authBloc,
                email: email,
                password: password,
                formKey: key,
              ),
            ),
            SizedBox(
              height: Res.font,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do not have an account ? ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => sl<AuthBloc>(),
                          child: const SignUpScreen(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'SignUp',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColor.primaryColors,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
