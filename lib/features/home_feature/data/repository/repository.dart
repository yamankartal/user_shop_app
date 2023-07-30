import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';
import 'package:shopapp/features/home_feature/data/model/home_model.dart';
import 'package:shopapp/features/home_feature/data/sources/remote.dart';
import 'package:shopapp/features/products_feature/data/model/products_model.dart';
import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeRepositoryImp implements HomeRepository{
  final HomeRemote remote;
  final AuthLocal local;
  final InternetConnectionChecker internetConnectionChecker;
  HomeRepositoryImp(this.remote, this.internetConnectionChecker, this.local);
  @override
  Future<Either<Failure, HomeModel>> getAllData()async{
   if(await internetConnectionChecker.hasConnection){

      try{
        HomeModel?homeModel=await remote.getAllData();
        if(homeModel==null) {
          return Left(BackendFailure(""));
        }
          return Right(homeModel);
      }
      on ServerException{
        return Left(ServerFailure());
      }
    }

    else{
     return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(String productName)async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.searchProducts(productName, local.getId()!);
        if (res.isEmpty) {
          return Left(BackendFailure(""));
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
}

/*

 try{
      return Right(await );
    }
        on ServerException{
      return Left(ServerFailure());
        }
 */
