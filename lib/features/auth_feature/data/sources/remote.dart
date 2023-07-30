
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/user_model.dart';
import 'local.dart';

class AuthRemote{


 Future<Map>checkEmail(String email,int userId)async{
    try {
      final response = await http.post(Uri.parse(checkEmailLink),
          body: {'email': email, 'user_id': userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        return res;
      }
      throw  ServerFailure();
    }
        catch(e){
      rethrow;
        }
  }

 Future  signIn(Map<String,dynamic>data)async{
    try{
      final response=await http.post(Uri.parse(signInLink),body:data);
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<UserModel?> signUp(Map<String,dynamic>data)async{
    try{
      final response=await http.post(Uri.parse(signUpLink),body: data);
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
       if(res['success']){
         final Map<String,dynamic> map=res['user'];
         return UserModel.fromJson(map);
       }else{
         return null;
       }
      }
      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }

 Future<bool> verifyCode(Map<String,dynamic>data)async{
    try{
      final response=await http.post(Uri.parse(verifyCodeLink),body: data);
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

Future<bool> resetPassword(Map<String,dynamic>data)async{
  try{
    final response=await http.post(Uri.parse(resetPasswordLink),body:data);
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


}

