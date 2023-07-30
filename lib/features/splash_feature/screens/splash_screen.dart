import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:shopapp/features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'package:shopapp/features/tracking_feature/presentation/bloc/tracking_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/enums.dart';
import '../../../core/constants/fire_base.dart';
import '../../../core/constants/responsive.dart';
import '../../../injection.dart';
import '../../auth_feature/presentation/bloc/auth_bloc.dart';
import '../../auth_feature/presentation/screens/sign_in_screen.dart';
import '../../home_page_feature/presentation/bloc/home_page_bloc.dart';
import '../../home_page_feature/presentation/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late OrdersBloc ordersBloc;
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(IsSignInEvent());
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsive(context);
    listenToNotification(ordersBloc,BlocProvider.of<TrackingBloc>(context));
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if(state.isSignInState==States.loaded){
          if(state.isSignIn){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BlocProvider(create: (_)=>sl<HomePageBloc>(),child: const HomePage(),)));
          }else{
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BlocProvider(create: (_)=>sl<AuthBloc>(),child:const SignInScreen(),)));
          }


        }

      },
      child: Scaffold(
        body: Container(
          color: AppColor.primaryColors,
          width: Res.width,
          height: Res.fullHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Res.height * 0.6,
                width: Res.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/logoapp.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
