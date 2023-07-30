import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import '../../../../core/constants/failures.dart';

import '../../domain/repository/repository.dart';
import '../model/user_model.dart';
import '../sources/local.dart';
import '../sources/remote.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
class AuthRepositoryImp extends AuthRepository {
  final InternetConnectionChecker internetConnectionChecker;
  final AuthRemote remote;
  final AuthLocal local;

  AuthRepositoryImp(this.remote, this.internetConnectionChecker, this.local);


  @override
  Future<Either<Failure, Unit>> checkEmail(String email) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.checkEmail(email,local.getId()??0);
        print(res);
        if (res['success']) {
          return const Right(unit);
        }
        return Left(BackendFailure(res['message']));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn(Map<String, dynamic>data) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.signIn(data);
        if (res['success']) {
          final Map<String,dynamic> map=res['user'];
          final UserModel userModel=UserModel.fromJson(map);
          local.signIn(userModel.userId!);
          return const Right(unit);
        } else {
          return Left(BackendFailure(res['msg']));
        }
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(Map<String, dynamic>data) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.signUp(data);
        if (res == null) {
          return Left(BackendFailure("email or phone already taken"));
        }
        return Right(res);
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyCode(Map<String, dynamic>data) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.verifyCode(data);
        if (res) {
          return const Right(unit);
        }
        return Left(BackendFailure("wrong code"));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(Map<String, dynamic> data) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.resetPassword(data);
        if (res) {
          return const Right(unit);
        }
        return Left(ServerFailure());
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      return Right(local.isSignIn());
    }
    on CacheException {
      return Left(CacheFailure());
    }
  }


  @override
   Either<Failure, Unit> signOut() {
    try{
        local.signOut(local.getId()!);
        return  const Right(unit);
      }
       on CacheException{
      return Left(CacheFailure());
    }
  }

}

