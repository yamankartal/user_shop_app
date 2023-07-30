import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/order_model.dart';
import '../model/order_details_model.dart';

class OrdersRemote{

 Future<List<OrderModel>>getOrders(int userId)async{
   try{
     final response=await http.post(Uri.parse(getOrdersLink),body: {"user_id":userId.toString()});
     if(response.statusCode==200){
       final res=jsonDecode(response.body);
       if(res['success']){
         final List list=res['orders'];
         return list.map((e) => OrderModel.fromJson(e)).toList();
       }
       return [];
     }
     throw ServerFailure();
   }
   catch(e){
     throw ServerFailure();
   }
 }
 
 
 Future<OrderDetailsModel?>getOrderDetailsModel(int orderId)async{
   try{
     final response=await http.post(Uri.parse(getOrderDetailsLink),body: {'order_id':orderId.toString()});
     if(response.statusCode==200){
       final res=jsonDecode(response.body);
       if(res['success']){
         final Map<String,dynamic> map= res['res'];

         return OrderDetailsModel.fromJson(map);
       }
       return null;
     }
     throw ServerFailure();
   }
       catch(e){

     rethrow;
       }
 }



 Future<bool>deleteOrder(int orderId)async{
   try{
     final response=await http.post(Uri.parse(deleteOrderLink),body: {'order_id':orderId.toString()});
     if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
     }
     throw ServerFailure();
   }
   catch(e){
     throw ServerFailure();
   }
 }

 Future<List<OrderModel>>getArchivedOrders(int userId)async{
   try{
     final response=await http.post(Uri.parse(getArchivedOrdersLink),body: {"user_id":userId.toString()});
     if(response.statusCode==200){
       final res=jsonDecode(response.body);
       if(res['success']){
         print(res['archived_orders']);
         final List list=res['archived_orders'];
         return list.map((e) => OrderModel.fromJson(e)).toList();
       }
       return [];
     }
     throw ServerFailure();
   }
   catch(e){
     rethrow;
   }
 }

 Future<bool>rateOrder(int orderId,Map<String,dynamic>data)async{
   try{
     print(0);
     final response=await http.post(Uri.parse(rateOrderLink),body: data..addAll({'order_id':orderId.toString()}));
     if(response.statusCode==200){
       print('yes');
       final res=jsonDecode(response.body);
        return res['success'];
     }
     throw ServerFailure();
   }
   catch(e){
     throw ServerFailure();
   }

 }

 Future<Position> getPosition()async{
   try{
     final  Position position= await Geolocator.getCurrentPosition();
     return position;

   }
   catch(e){
     rethrow;
   }
 }

}