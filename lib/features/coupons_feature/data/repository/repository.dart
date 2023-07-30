import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopapp/core/constants/exceptions.dart';


import 'package:shopapp/features/coupons_feature/data/model/coupon_model.dart';
import 'package:shopapp/features/coupons_feature/data/sources/remote.dart';

import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';

class CouponsRepositoryImp extends CouponsRepository{
  final CouponsRemote remote;
  final InternetConnectionChecker internetConnectionChecker;
  CouponsRepositoryImp(this.internetConnectionChecker, this.remote);
  @override
  Future<Either<Failure, List<CouponModel>>> getCoupons()async{
      if(await internetConnectionChecker.hasConnection){
          try{
            final res=await remote.getCoupons();
            if(res.isEmpty){
              return Left(BackendFailure(""));
            }
            return Right(res);
          }
        on ServerException{
             return Left(ServerFailure());
        }
      }
      else{
        return Left(ConnectionFailure());
      }
  }

}