import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';

class CategoriesTextWidget extends StatelessWidget {
  const CategoriesTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: Res.font,left: Res.padding),
      child:
      Padding(
        padding: EdgeInsets.only(left: Res.padding),
        child: Text("Categories",style:Theme.of(context).textTheme.headline3!.copyWith(fontSize: Res.font),),
      ),
    );
  }
}
