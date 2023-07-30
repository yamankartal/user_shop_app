import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/success_screen.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../components/text_form_fieldWidget.dart';
import '../../validate/validate.dart';
import '../bloc/auth_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
final String email;

  const ResetPasswordScreen({Key? key, required this.email,}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final  TextEditingController newPassword=TextEditingController();
  final  TextEditingController confirmPassword=TextEditingController();
  final  GlobalKey<FormState>key=GlobalKey<FormState>();


late FromScreen fromScreen;
 late AuthBloc authBloc;

 @override
  void initState() {
   authBloc=BlocProvider.of<AuthBloc>(context);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
      ),
      body:SizedBox(
        width: Res.width,
        height: Res.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'New password',
                textAlign: TextAlign.center,
                style:TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: Res.font*2
                ),
              ),
              SizedBox(height: Res.font,),
              Form(
                key: key,
                child:Column(
                  children: [
                 BlocBuilder<AuthBloc,AuthState>(
                   builder: (_,state)=> TextFormFieldWidget(
                     hidePassword: state.hidePassword,
                     validate: (String? val ) {
                       return validate(max: 20, min: 10, type: Auth.password, val: val);
                     },
                     onTap: (){
                       authBloc.add(EventPasswordVisibility());
                     },
                     label: 'new password',
                     hint: 'Enter new password',
                     textEditingController: newPassword,
                     iconData:state.hidePassword?Icons.visibility_off:Icons.visibility,
                   ),
                 ),
                 SizedBox(
                      height: Res.padding,
                    ),
                 BlocBuilder<AuthBloc,AuthState>(
                   builder: (_,state)=>   TextFormFieldWidget(
                     hidePassword: state.hidePassword,
                     validate: (String? val ) {
                       return validate(max: 20, min: 10, type: Auth.confirmPassword, val: val,textEditingController: newPassword);
                     },

                     label: 'confirm password',
                     hint: 'confirm new password',
                     textEditingController: confirmPassword,
                     onTap: (){
                       authBloc.add(EventPasswordVisibility());
                     }, iconData: state.hidePassword?Icons.visibility_off:Icons.visibility,
                   ),
                 ),
                  ],
                )

              ),
              SizedBox(
                 height: Res.font,
                 ),
              Container(
                width: Res.width*7,
                height: Res.font*1.2,
                padding: EdgeInsets.symmetric(horizontal: Res.font),
                child: BlocListener<AuthBloc, AuthState>(
                  listenWhen: (p,c)=>p.resetPasswordState!=c.resetPasswordState,
                  listener: (context, state) {
                    if(state.resetPasswordState==States.loaded) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BlocProvider(
                     create: (_)=>sl<AuthBloc>(),
                      child: const SuccessScreen(),
                    ),),);
                    }
                    else{
                      //showSnackBar(context, '');
                    }
                       },
                      child: MaterialButton(
                  height: Res.font*1.2,
                  textColor: Colors.white,
                  color: AppColor.primaryColors,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Res.font)),
                  onPressed: () {
                      if(key.currentState!.validate()){
                         authBloc.add(EventResetPassword(widget.email,newPassword.text));
                      }
                  },
                  child: Text("Save",style: TextStyle(fontSize: Res.font),),
                ),
),
              ),
            ],

    )
    )
      )

    );
  }
}
