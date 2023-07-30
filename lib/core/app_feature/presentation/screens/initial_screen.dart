import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/auth_feature/presentation/bloc/auth_bloc.dart';
import '../../../../features/splash_feature/screens/splash_screen.dart';
import '../../../../injection.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme:  AppBarTheme(
                  backgroundColor: AppColor.primaryColors,
                  titleTextStyle: TextStyle(fontSize: Res.font)
              ),
              primaryColor: AppColor.primaryColors,
              textTheme: TextTheme(
                bodyText1: TextStyle(fontSize: Res.font,color:Colors.black,),
                bodyText2: TextStyle(fontSize: Res.font*0.8,color:Colors.black),
                headline2: TextStyle(fontSize: Res.font,color:Colors.white),
                headline3: TextStyle(fontSize: Res.font*0.8,color: Colors.black),
                headline4: TextStyle(fontSize: Res.font*0.8, color:Colors.white,),
                headline5: TextStyle(fontSize: Res.font, color:Colors.grey,),
                headline6: TextStyle(fontSize: Res.font*0.8, color:Colors.grey[600],),
              ),
            ),
            home: BlocProvider(
              create: (_)=>sl<AuthBloc>(),
              child: const SplashScreen(),
            )
    );
  }
}





