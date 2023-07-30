import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class ProfileListTileWidget extends StatelessWidget {
  final Function() onTap;
  final String label;
  const ProfileListTileWidget({Key? key, required this.onTap, required this.label,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Res.padding*0.8),
      child:ListTile(
        onTap: onTap,
        trailing: Icon(
          Icons.arrow_forward,
          size: Res.font * 1.5,
          color: AppColor.primaryColors,
        ),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      )
    );
  }
}
