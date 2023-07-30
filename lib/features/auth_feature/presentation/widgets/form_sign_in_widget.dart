import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/text_form_fieldWidget.dart';
import '../../validate/validate.dart';
import '../bloc/auth_bloc.dart';

class FormSignInWidget extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  final AuthBloc authBloc;

  const FormSignInWidget({Key? key, required this.email, required this.password, required this.formKey, required this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            textEditingController: email,
            label: 'Email',
            hint: 'Enter your email',
            iconData: Icons.email_outlined,
            validate: (String? val ) {
              return validate(max: 20, min: 10, type: Auth.email, val: val,);
            },
          ),
          BlocBuilder<AuthBloc,AuthState>(builder: (_,state){
            return  TextFormFieldWidget(
              hidePassword: state.hidePassword,
              validate: (String? val ) {
                return validate(max: 20, min: 10, type: Auth.password, val: val);
              },
              label: 'Password',
              hint: "Enter your password",

              textEditingController:password,
              onTap: (){
                authBloc.add(EventPasswordVisibility());
              },
              iconData:state.hidePassword?Icons.visibility_off:Icons.visibility,
            );
          }),
          SizedBox(
            height: Res.font,
          ),
        ],
      ),
    );
  }
}
