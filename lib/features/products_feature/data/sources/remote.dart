import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/product_details_model.dart';
import '../model/products_model.dart';

class ProductsRemote {


  Future<List<ProductModel>> getProducts(int categoryId,int userId) async {
    try {
      final response = await http.post(
          Uri.parse(getProductsLink), body: {
        "category_id": categoryId.toString(),
        'user_id': userId.toString()
      });
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          List list = res['products'];
          return list.map((e) => ProductModel.fromJson(e)).toList();
        }
        return [];
      }
      throw ServerFailure();
    }
    catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getFavoriteProducts(int userId)async{
    try{
      final response=await http.post(Uri.parse(getFavoriteProductsLink),body: {'user_id':userId.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          List list=res['favorite_products'];
          return list.map((e) =>ProductModel.fromJson(e)).toList();
        }
        return [];
      }
      throw ServerFailure();

    }
    catch(e){
      rethrow;
    }
  }


  Future<bool> addProductToFavorite(int productId,int userId)async{
    try {
      final response=await http.post(Uri.parse(addProductToFavoriteLink),body: {'user_id':userId.toString(),'product_id':productId.toString()});
      if(response.statusCode==200) {
        final res = jsonDecode(response.body);
        return res['success'];
      }
      throw ServerFailure();

    } catch(e) {
      throw ServerFailure();
    }
  }

  Future<bool> removeProductFromFavorite(int productId,int userId) async {
    try {
      final response=await http.post(Uri.parse(removeProductFromFavoriteLink),body: {'user_id':userId.toString(),'product_id':productId.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
      }
      throw ServerFailure();

    } catch(e) {
      throw ServerFailure();
    }
  }

  Future<List<ProductModel>>searchProducts(String productName,int userId)async{
    try {

      final response = await http.post(
          Uri.parse(searchProductsLink), body: {'product_name':productName,'user_id':userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          List list = res['products'];
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


  Future<ProductDetailsModel?> getProductDetails(int productId) async{
    try {
      final response = await http.post(Uri.parse(getProductDetailsLink), body: {'product_id':productId.toString(),});
      if (response.statusCode == 200) {

        final res = jsonDecode(response.body);
        if (res['success']) {
          Map <String,dynamic>map = res['product_details'];
          return ProductDetailsModel.fromJson(map);
        }
        else {
          return null;
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
  }

 */