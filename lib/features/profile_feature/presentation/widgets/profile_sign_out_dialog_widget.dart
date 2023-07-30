import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:shopapp/features/auth_feature/presentation/screens/sign_in_screen.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';

class ProfileSignOutWidget extends StatelessWidget {
  const ProfileSignOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure you want to log out ?',
        style: TextStyle(fontSize: Res.font),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "no",
            style: TextStyle(
                color: AppColor.primaryColors, fontSize: Res.font * 0.8),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>BlocProvider(create: (_)=>sl<AuthBloc>(),child: const SignInScreen(),)), (route) => false);
          },
          child: Text(
            "yes",
            style: TextStyle(
                color: AppColor.primaryColors, fontSize: Res.font * 0.8),
          ),
        ),
      ],
    );
  }
}
