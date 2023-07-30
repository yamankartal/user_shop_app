import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/features/auth_feature/data/model/user_model.dart';
import 'package:shopapp/features/profile_feature/presentation/bloc/profile_bloc.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/responsive.dart';

class UserImageWidget extends StatelessWidget {
  final ProfileBloc profileBloc;
  final UserModel userModel;

  const UserImageWidget(
      {Key? key, required this.userModel, required this.profileBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Res.height * 0.2),
      child: Container(
        height: Res.height * 0.2,
        width: Res.width * 0.4,
        decoration: BoxDecoration(
          image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/img_329115.png"),
                  ),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black)),
      ),
    );
  }
}
