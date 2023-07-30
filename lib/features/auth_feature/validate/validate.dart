
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../../core/constants/enums.dart';


String ?validate(


    {
  required final int max,
  required final int min,
  required final Auth type,
  required final String? val,
  final TextEditingController ?textEditingController,
}){
  if(val!.isEmpty) {
    return '${authStateToString(type)} con not be empty';
  }
  if(type==Auth.email&&!GetUtils.isEmail(val)){
      return 'wrong email';
    }

  if(type==Auth.userName&&!GetUtils.isUsername(val)){
      return 'wrong Username';
    }

  if(type==Auth.password){
  }

  if(type==Auth.confirmPassword&&textEditingController!.text!=val){
      return 'no match';
    }
  // if(type==Auth.phone&&GetUtils.isPhoneNumber(val)){
  //     return 'wrong PhoneNumber';
  //   }
  return null;
}
String authStateToString(Auth auth) {
  switch (auth) {
    case Auth.userName:
      return 'user name';
    case Auth.password:
      return 'password';
    case Auth.confirmPassword:
      return 'confirm password';
    case Auth.email:
      return 'email';
    case Auth.phone:
      return 'phone';
  }
}



