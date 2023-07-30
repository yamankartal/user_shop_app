import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../components/text_form_fieldWidget.dart';
import '../../validate/validate.dart';
import '../bloc/auth_bloc.dart';

class SignUpFormWidget extends StatelessWidget {
  final GlobalKey<FormState>formKey;
  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword ;
  final TextEditingController phone;
  final AuthBloc authBloc;
  const SignUpFormWidget({Key? key, required this.formKey, required this.userName, required this.email, required this.confirmPassword, required this.phone, required this.authBloc, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            validate: (String? val) {
              return validate(
                  max: 20, min: 10, type: Auth.userName, val: val);
            },
            label: 'UserName',
            hint: 'Enter your you userName',
            iconData: Icons.person_outline,
            textEditingController: userName,
          ),
          TextFormFieldWidget(
            textEditingController: email,
            validate: (String? val) {
              return validate(
                  max: 20, min: 10, type: Auth.email, val: val);
            },
            label: 'Email',
            hint: 'Enter your email',
            iconData: Icons.email_outlined,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (_, state) => TextFormFieldWidget(
              hidePassword: state.hidePassword,
              onTap: () {
                authBloc.add(EventPasswordVisibility());
              },
              textEditingController: password,
              validate: (String? val) {
                return validate(
                    max: 20,
                    min: 10,
                    type: Auth.password,
                    val: val);
              },
              label: 'Password',
              hint: "Enter your password",
              iconData: state.hidePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (_, state) => TextFormFieldWidget(
              hidePassword: state.hidePassword,
              textEditingController: confirmPassword,
              validate: (String? val) {
                return validate(
                    max: 20,
                    min: 10,
                    type: Auth.confirmPassword,
                    val: val,
                    textEditingController: password);
              },
              onTap: () {
                authBloc.add(EventPasswordVisibility());
              },
              label: 'confirmPassword',
              hint: "confirm your password",
              iconData: state.hidePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
          TextFormFieldWidget(
            textInputType: TextInputType.phone,
            textEditingController: phone,
            validate: (String? val) {
              return validate(
                  max: 20, min: 10, type: Auth.phone, val: val);
            },
            label: 'phone',
            hint: "Enter your number",
            iconData: Icons.smartphone,
          ),
        ],
      ),
    );
  }
}
