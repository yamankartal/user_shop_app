import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../../auth_feature/data/model/user_model.dart';

abstract class ProfileRepository{
  Future<Either<Failure,UserModel>>getUserData();
  Future<Either<Failure,Unit>>updateUserName(String userName);
  Future<Either<Failure,String>>updateImage(Map<String,dynamic>data);
  Future<Either<Failure,String>>addImage(Map<String,dynamic>data);
  Future<Either<Failure,Unit>>deleteImage();
}