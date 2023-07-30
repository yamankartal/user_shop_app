import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../../../products_feature/data/model/products_model.dart';
import '../model/home_model.dart';

class HomeRemote{


  Future<HomeModel?> getAllData()async{
    try{
      final response=await http.post(Uri.parse(homeLink));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          Map<String,dynamic> data=res['data'];
         return HomeModel.fromJson(data);
        }
        else{
          return null;
        }
      }
      else{
        throw ServerFailure();
      }
    }
        catch(e){
      rethrow;

        }
  }


  Future<List<ProductModel>>searchProducts(String productName,int userId)async{
    try {
      final response = await http.post(
          Uri.parse(searchProductsLink), body: {'product_name':productName,'user_id':userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          List list = res['products_searched'];
          return list.map((e) => ProductModel.fromJson(e)).toList();
        }
        else {
          return [];
        }
      }
      else {
        throw ServerFailure();
      }
    }
    catch (e) {
      rethrow;
    }
  }


}

/*
try{}
        catch(e){
      throw ServerFailure();
        }

 */