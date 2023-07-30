import 'package:flutter/material.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/sign_in_screen.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SuccessScreen extends StatefulWidget {

  const SuccessScreen({Key? key, }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

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
      body: SizedBox(
        width: Res.width,
        height: Res.height,
        child: Column(
          children: [
            Text('Success',style: TextStyle(color: AppColor.grey,fontSize: Res.font*2),),
            SizedBox(height: Res.font),
            Icon(Icons.check_circle_outline,color: AppColor.primaryColors,size: Res.height*0.3,),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: Res.padding),
              margin: EdgeInsets.only(bottom: Res.font),
              width: Res.width*0.8,
              child:MaterialButton(

                color: AppColor.primaryColors,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Res.padding),
                ),
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>
                      BlocProvider(create: (BuildContext context)=>sl<AuthBloc>(),
                        child: const SignInScreen(),
                      )
                  ));
                },
                child: Text('Go to LogIn',style:Theme.of(context).textTheme.headline4,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
