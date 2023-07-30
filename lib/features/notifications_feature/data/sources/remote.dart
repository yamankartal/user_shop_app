import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/notifications_model.dart';

class NotificationsRemote{

  Future<List<NotificationModel>> getNotifications(int userId)async{
    try{
      final response=await http.post(Uri.parse(getNotificationsLink),body:{'user_id':userId.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          final List list=res['notifications'];
          return list.map((e) => NotificationModel.fromJson(e)).toList();
        }
        return [];
      }

      throw ServerFailure();
    }
        catch(e){
      throw ServerFailure();
        }
  }
}