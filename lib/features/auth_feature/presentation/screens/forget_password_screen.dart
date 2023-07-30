import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/bloc/auth_bloc.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../components/text_form_fieldWidget.dart';
import '../../validate/validate.dart';
import '../widgets/check_email_button_widget.dart';
import '../widgets/check_email_text_widget.dart';
import '../widgets/enter_email_address_tet_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final FromScreen fromScreen;

  const ForgetPasswordScreen({Key? key, required this.fromScreen})
      : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late FromScreen fromScreen;
  late AuthBloc authBloc;

  @override
  void initState() {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CheckEmailTextWidget(),
              const EnterEmailAddressTextWidget(),
              Form(
                key: key,
                child: TextFormFieldWidget(
                  validate: (String? val) {
                    return validate(
                        max: 20, min: 10, type: Auth.email, val: val);
                  },
                  label: 'Email',
                  hint: 'Enter your email',
                  iconData: Icons.email_outlined,
                  textEditingController: email,
                ),
              ),
              CheckEmailButtonWidget(email: email, formKey: key, authBloc: authBloc,),
            ],
          ),
        ),
      ),
    );
  }
}
