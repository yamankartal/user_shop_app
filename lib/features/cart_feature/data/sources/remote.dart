import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/cart_model.dart';

class CartRemote{



  Future<bool> addToCart(final int productId,int userId,Map<String,dynamic>data)async{
    try{
      final response=await http.post(Uri.parse(cartAddLink),body:data..addAll({
        "user_id":userId.toString(),
        "cart_product_id":productId.toString(),
      }));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        print(res);
        return res['success'];
      }
        throw ServerFailure();

    }
    catch(e){
      rethrow;
    }

  }


  Future<bool> discountItemFromCart(int userId, int productId)async{
    try{
      final response=await http.post(Uri.parse(cartDiscountLink),body: {
        "user_id":userId.toString(),
        "product_id":productId.toString(),
      });
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

  Future<List<CartModel>> getCart(int userId)async{
    try{
      final response=await http.post(Uri.parse(cartGetLink),body: {
        "user_id":userId.toString()
      });
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        List list=res['success']?res['cart']:[];
          return list.map((e) =>CartModel.fromJson(e)).toList();
        }
      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }

  Future<bool> removeProductFromCart(int cartId)async{
    try{
      final response=await http.post(Uri.parse(cartRemoveLink),body: {
        "cart_id":cartId.toString(),

      });
      if(response.statusCode==200)
        {
          final res=jsonDecode(response.body);
          final bool r= res['success'];
          print(res);
          return r;
        }
        throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }

  Future<bool> updateCart(final int cartId,Map<String,dynamic>data)async{
    try{
      print(cartId);
      final response=await http.post(Uri.parse(cartUpdateLink),body:data..addAll({
        "cart_id":cartId.toString(),
      }));
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

}
/*
   try{}
        catch(e){
      rethrow;
        }
 */