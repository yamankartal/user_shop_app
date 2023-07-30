


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/failures.dart';

class AuthLocal{

  final SharedPreferences sharedPreferences;
  AuthLocal(this.sharedPreferences);

 bool isSignIn(){
   try{
    return getId()==null?false:true;
   }
   catch(e){
     throw CacheFailure();
   }
 }

  void signIn(int userId){
    try{
      sharedPreferences.setInt('id', userId);
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$userId");
    }
    catch(e){
      throw CacheFailure();
    }
  }

  void signOut(int userId) {
    try {
      sharedPreferences.remove('id');
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    }
    catch (e) {
      throw CacheFailure();
    }
  }

    int? getId(){
      try{
       return sharedPreferences.getInt('id');
      }
      catch(e){
        throw CacheFailure();
      }
    }

  }




