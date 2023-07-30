

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shopapp/core/constants/constants.dart';
import 'package:shopapp/core/constants/widgets.dart';
import 'package:shopapp/features/tracking_feature/presentation/bloc/tracking_bloc.dart';

import '../../features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'enums.dart';

listenToNotification(final OrdersBloc ordersBloc,final TrackingBloc trackingBloc){


  FirebaseMessaging.onMessage.listen((event) {
    print("###################################");

      final Map map=event.data;
      final body=jsonDecode(map['body']);
      print(body);
      if(map['pagename']=="tracking"){
        trackingBloc.add(RefreshDeliveryLocation(double.parse(body['lat']),double.parse( body['long'])));
      }else if(map['pagename']=="orders"){
        ScaffoldMessenger.of(navigatorKey.currentState!.context).hideCurrentSnackBar();
        showSnackBar(navigatorKey.currentState!.context,body['message']);
        FlutterRingtonePlayer.playNotification(volume:3);
        final int orderId=int.parse(body['order_id']);
        final int orderStatus=(body['order_status']);
        ordersBloc.add(RefreshOrderStatusEvent(orderId,orderStatus,));
        if(screen==Screen.orderDetails) {
          print(0);
          ordersBloc.add(RefreshOrderDetailsStatusEvent(body['order_status']));
        }
      }else{
      FlutterRingtonePlayer.playNotification(volume:3);
    }





  });
}




initFireBaseMessaging()async{
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
}





