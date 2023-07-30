import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart ' as http;
import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../../../auth_feature/data/model/user_model.dart';

class ProfileRemote{


  Future<Map> updateUserName(String userName,int userId)async{
    try {
      final response = await http.post(
          Uri.parse(updateUserNameLink), body: {"user_name": userName,"user_id":userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
           rethrow;
        }
  }

  Future<UserModel?>getUserData(int userId)async{
    try {
      print(userId);
      final response = await http.post(
          Uri.parse(getUserDataLink), body: {"user_id":userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if(res['success']){
          final Map<String,dynamic> map=res['user'];
          return UserModel.fromJson(map);

        }
        return null;
      }
      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }

  Future<String?> addImage(Map<String,dynamic>data,int userId)async{
    try{

      final File file=File(data['image']);
      final request=http.MultipartRequest("POST",Uri.parse(addUserImageLink));
      final length=await file.length();
      final stream= http.ByteStream(file.openRead());
      final multiPartFile= http.MultipartFile("image",stream,length,filename:file.path);
      request.files.add(multiPartFile);


    //  map.forEach((key, value) {request.fields[key]=value;});
      request.fields['user_id']=userId.toString();
      final response= await request.send();
      if(response.statusCode==200){
        final res=await http.Response.fromStream(response);
        final r=jsonDecode(res.body);
        if(r['success']){
          return r['image'];
        }
        return null;
      }
      else{
        throw ServerFailure();
      }
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<String?> updateImage(Map<String,dynamic>data,int userId)async{
    try{
      final File file=File(data['image']);
      final request=http.MultipartRequest("POST",Uri.parse(addUserImageLink));
      final length=await file.length();
      final stream= http.ByteStream(file.openRead());
      final multiPartFile= http.MultipartFile("image",stream,length,filename:file.path);
      request.files.add(multiPartFile);


      //  map.forEach((key, value) {request.fields[key]=value;});
      request.fields['user_id']=userId.toString();
      request.fields['old_image']=data['old_image'];
      final response= await request.send();
      if(response.statusCode==200){
        final res=await http.Response.fromStream(response);
        final r=jsonDecode(res.body);
        if(r['success']){
          final String string=r['image'];
          return string;
        }
        return null;
      }
      else{
        throw ServerFailure();
      }
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<bool> deleteImage(int userId)async{
    try {
      final response = await http.post(
          Uri.parse(deleteUserImageLink), body: {"user_id":userId.toString()});
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if(res['success']){
          return true;
        }
        return false;
      }
      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }
  }


}