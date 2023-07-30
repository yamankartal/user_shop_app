import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';
import 'package:shopapp/features/cart_feature/data/model/cart_model.dart';
import 'package:shopapp/features/cart_feature/data/sources/local.dart';
import 'package:shopapp/features/cart_feature/data/sources/remote.dart';
import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';

class CartRepositoryImp extends CartRepository{
 final CartRemote remote;
 final AuthLocal local;
  CartRepositoryImp(this.remote, this.local);

  @override
  Future<Either<Failure,Unit>> addProductToCart(final int productId,final Map<String,dynamic>data)async{
    try{
   final res=await remote.addToCart(productId, local.getId()!,data,);
   if(res) {
     return const Right(unit);
   }
   return Left(BackendFailure(""));
    }
        on ServerException{
        return Left(ServerFailure());
        }

  }

  @override
  Future<Either<Failure, Unit>> decreaseProductQuantityFromCart(final int productId)async {
    try{
      final res=await remote.discountItemFromCart(local.getId()!, productId);
      if(res){
        return const Right(unit);
      }
      return Left(BackendFailure(""));
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart()async {
    try {
      final List<CartModel>list=await remote.getCart(local.getId()!);
      if(list.isEmpty){
        return Left(BackendFailure(""));
      }
      return Right(await remote.getCart(local.getId()!));
    }
    on ServerException {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, Unit>> removeProductFromCart(int cartId)async {
   try{
     final res =await remote.removeProductFromCart(cartId);
     if(res){
       return const Right(unit);
    }
     return Left(BackendFailure(""));
   }

       on ServerException{
     return Left(ServerFailure());
       }

  }

  @override
  Future<Either<Failure, Unit>> updateCart(final int cartId,Map<String,dynamic>data)async {
    try{
      final res=await remote.updateCart(cartId, data);
        return  Right(res?unit:unit);
    }
        on ServerException{
      return Left(ServerFailure());
        }
    }


}
