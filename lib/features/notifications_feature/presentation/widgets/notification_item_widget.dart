import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shopapp/features/notifications_feature/data/model/notifications_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItemWidget({Key? key, required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding)
      ),
      elevation: Res.padding,
      child: ListTile(
        title: Text(notificationModel.notificationTitle!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: Res.font*0.9),),
        subtitle: Text(notificationModel.notificationBody!,style: TextStyle(height:Res.tinyFont*0.7,color: Colors.black54,fontSize: Res.font*0.8),),
        trailing:Text(Jiffy(notificationModel.notificationDateTime!,"yyyy-MM-dd",

        ).fromNow(),
          style: TextStyle(color: AppColor.primaryColors,fontWeight: FontWeight.bold,fontSize: Res.font*0.7),
        ),
      ),
    );
  }
}
