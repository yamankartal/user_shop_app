import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/core/constants/failures.dart';


import 'package:shopapp/features/auth_feature/data/model/user_model.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';

import '../../domain/repository/repository.dart';
import '../sources/remote.dart';

class ProfileRepositoryImp extends ProfileRepository{

  final AuthLocal local;
  final ProfileRemote remote;

  ProfileRepositoryImp(this.local, this.remote);

  @override
  Future<Either<Failure, Unit>> updateUserName(String userName)async {
    try{
      final  res=await remote.updateUserName(userName,local.getId()!);
      if(res['success']){
        return const Right(unit);
      }
      return Left(BackendFailure(""));

    }
    on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData()async {
    try{
      final UserModel?userModel= await remote.getUserData(local.getId()!);
      if(userModel==null){
        return Left(BackendFailure(""));
      }
      return Right(userModel);

    }
    on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> addImage(Map<String, dynamic> data)async {
    try{
      final  res= await remote.addImage(data,local.getId()!);
      if(res!=null){
        return  Right(res);
      }
      return Left(BackendFailure(""));


    }
    on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateImage(Map<String, dynamic> data)async {
    try{
      final res= await remote.updateImage(data,local.getId()!);
      if(res!=null){
        return  Right(res);
      }
      return Left(BackendFailure(""));
    }
    on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteImage()async {
    try{
      final res= await remote.deleteImage(local.getId()!);
      if(res){
        return  const Right(unit);
      }
      return Left(BackendFailure(""));
    }
    on CacheException{
      return Left(CacheFailure());
    }
  }





}