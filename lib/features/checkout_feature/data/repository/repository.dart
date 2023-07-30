import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';


import '../../../../core/constants/failures.dart';
import '../../../auth_feature/data/sources/local.dart';
import '../../../coupons_feature/data/model/coupon_model.dart';
import '../../domain/repository/repository.dart';
import '../model/check_out_model.dart';
import '../sources/remote.dart';

class CheckOutRepositoryImp extends CheckOutRepository{

  final CheckOutRemote remote;
  final AuthLocal local;
  CheckOutRepositoryImp(this.remote,this.local);
  @override
  Future<Either<Failure, CouponModel>> checkCoupon(Map<String,dynamic>data)async {
    try{
      final res=await remote.checkCoupon(data);
      if(res!=null){
        return Right(res);
      }
      return Left(BackendFailure(""));
    }
        on ServerException{
      return Left(ServerFailure());
        }
  }



  @override
  Future<Either<Failure, Unit>> sendOrder(Map<String, dynamic> data)async {
    try{
      return remote.sendOrder(data,local.getId()!).then((value) => const Right(unit));
    }
        on ServerException{
      return Left(ServerFailure());
        }
  }

  @override
  Future<Either<Failure, CheckOutModel>> checkOutOrder(Map<String, dynamic> data)async{
    try{
     return  remote.checkOutOrder(data,local.getId()!).then((value) => value==null?Left(BackendFailure("")):Right(value));
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }



}