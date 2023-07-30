import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';



import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import '../model/order_details_model.dart';
import '../model/order_model.dart';
import '../sources/remote.dart';

class OrdersRepositoryImp extends OrdersRepository{
  final OrdersRemote remote;
  final AuthLocal local;
  OrdersRepositoryImp(this.remote, this.local);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async{
    try{
      final List<OrderModel>list=await remote.getOrders(local.getId()!);
      if(list.isEmpty){
        return Left(BackendFailure(""));
      }

      return Right(list);
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(int orderId) async{
    try{
              OrderDetailsModel? orderDetailsModel=await remote.getOrderDetailsModel(orderId);
              if(orderDetailsModel==null){
                return Left(BackendFailure(""));
              }
              return Right(orderDetailsModel);
    }
        on ServerException{
      return Left(ServerFailure());
        }
  }

  @override
  Future<Either<Failure, bool>> deleteOrder(int orderId)async {
    try{
      final res=await remote.deleteOrder(orderId);
      return Right(res);
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getArchivedOrders()async {
    try{
      final List<OrderModel>res=await remote.getArchivedOrders(local.getId()!);
      if(res.isEmpty) {
        return Left(BackendFailure(""));
      }
      return Right(res);
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> rateOrder(int orderId,Map<String,dynamic>data)async{
   try{
     final res=await remote.rateOrder(orderId,data);
     return Right(res);
   }
   on ServerException{
     return Left(ServerFailure());
   }
  }

  @override
  Future<Either<Failure,Position>> getPosition()async {
    try{
      return Right(await remote.getPosition());
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}