import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/user_model.dart';
abstract class AuthRepository{

 Future<Either<Failure,Unit>>signIn(Map<String,dynamic>data);
 Future<Either<Failure,UserModel>>signUp(Map<String,dynamic>data);
 Future<Either<Failure,Unit>>checkEmail(String email);
 Future<Either<Failure,Unit>>verifyCode(Map<String,dynamic>data);
 Future<Either<Failure,Unit>>resetPassword(Map<String,dynamic>data);
 Future<Either<Failure,bool>>isSignIn();
 Either<Failure,Unit>signOut();
}