import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../../../coupons_feature/data/model/coupon_model.dart';
import '../model/check_out_model.dart';

class CheckOutRemote{
  Future<CouponModel?> checkCoupon(Map<String,dynamic>data)async{
    try{
      final response=await http.post(Uri.parse(checkCouponLink),body: data);
      if(response.statusCode==200)
        {
          final res=jsonDecode(response.body);
          if(res['success']) {
            final Map<String,dynamic> map=res['coupon'];
            return  CouponModel.fromJson(map);
          }
          return null;
        }


        throw ServerFailure();
    }
        catch(e){
      throw ServerFailure();
        }
  }


  
  Future<bool>sendOrder(Map<String,dynamic>data,int userId)async {
    try{
      final response=await http.post(Uri.parse(sendOrderLink),body:data..addAll({'order_user_id':userId.toString()}));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
      }
      throw ServerFailure();
    }
        catch(e){
      rethrow;
        }
  }

  Future<CheckOutModel?>checkOutOrder(Map<String,dynamic>data,int userId)async{
      try{
        final response=await http.post(Uri.parse(checkOutLink),body:data..addAll({"user_id":userId.toString()}));
        if(response.statusCode==200){
          final res=jsonDecode(response.body);
          if(res['success']){
            final Map<String,dynamic>map=res['check_out'];
            return CheckOutModel.fromJson(map);
          }

          return null;
        }

        throw ServerFailure();
      }
          catch(e){
        rethrow;
          }
  }

}