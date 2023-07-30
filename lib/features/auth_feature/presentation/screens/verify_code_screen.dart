import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/reset_password_screen.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/success_screen.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/veridy_code_field_widget.dart';

class VerifyCodeScreen extends StatefulWidget {
  final FromScreen fromScreen;
  final String email;

  const VerifyCodeScreen(
      {Key? key, required this.fromScreen, required this.email})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late AuthBloc authBloc;
  late FromScreen fromScreen;

  @override
  void initState() {
    print("###############init");
    print(widget.email);
    authBloc = BlocProvider.of<AuthBloc>(context);
    fromScreen = widget.fromScreen;
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
        child: Column(
          children: [
            Text('Verification Code',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: Res.padding),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Res.font),
              child: Text(
                'Please enter the digit code sent in ${widget.email}',
                style: TextStyle(
                  height: Res.tinyFont,
                  fontSize: Res.font * 0.7,
                  color: AppColor.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Res.font,
            ),
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (p, c) => p.verifyCodeState != c.verifyCodeState,
              listener: (_, state) {
                if (state.verifyCodeState == States.loaded) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => sl<AuthBloc>(),
                        child: fromScreen == FromScreen.forgetPassword
                            ? ResetPasswordScreen(
                                email: widget.email,
                              )
                            : const SuccessScreen(),
                      ),
                    ),
                  );
                } else if(state.verifyCodeState==States.error) {
                  showSnackBar(context, 'wrong code');
                }
              },
              child: VerifyCodeWidget(email: widget.email,authBloc: authBloc),
            ),
            SizedBox(
              height: Res.height * 0.2,
            ),
            MaterialButton(
                color: AppColor.primaryColors,
                minWidth: Res.width * 0.7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Res.padding)),
                onPressed: () {
                  showSnackBar(context, "verify code sent your email");
                },
                child: Text(
                  'send verify code',
                  style: Theme.of(context).textTheme.headline2,
                )),
          ],
        ),
      ),
    );
  }
}
