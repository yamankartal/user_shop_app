import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../cart_feature/presentation/bloc/cart_bloc.dart';
import '../../../cart_feature/presentation/screens/cart_screen.dart';

class ResendOrderWidget extends StatelessWidget {
  const ResendOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    MaterialButton(
      height: Res.font*2,
      minWidth: Res.width * 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Res.padding),
          topLeft: Radius.circular(Res.padding)
        )
      ),
      color: AppColor.primaryColors,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => sl<CartBloc>(),
              child: const CartScreen(),
            ),
          ),
        );
      },
      child: Text(
        "Resend order",
        style: TextStyle(
            color: Colors.white, fontSize: Res.font * 0.9),
      ),
    );
  }
}
