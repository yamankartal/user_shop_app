import 'dart:convert';

import 'package:http/http.dart 'as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/coupon_model.dart';

class CouponsRemote{

  Future<List<CouponModel>> getCoupons()async{
    try{
      final response=await http.post(Uri.parse(getCouponsLink));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          final List list=res['coupons'];
          return list.map((e) => CouponModel.fromJson(e)).toList();
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