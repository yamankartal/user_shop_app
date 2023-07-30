import 'dart:convert';


import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/category_model.dart';
import 'package:http/http.dart ' as http;
class CategoriesRemote{
  Future<List<CategoryModel>> getCategories()async{
    try{
      final response=await http.post(Uri.parse(getCategoriesLink,),);
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          final List list=res['categories'];
          return list.map((e) =>CategoryModel.fromJson(e)).toList();
        }
        return [];
      }

      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }


  Future<List<CategoryModel>>searchCategories(String categoryName)async{
    try{
      final response=await http.post(Uri.parse(searchCategoryLink,),body: {'category_name':categoryName});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          final List list=res['categories'];
          return list.map((e) =>CategoryModel.fromJson(e)).toList();
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