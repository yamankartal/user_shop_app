import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';

import 'package:shopapp/features/products_feature/data/model/product_details_model.dart';
import 'package:shopapp/features/products_feature/data/model/products_model.dart';


import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import '../sources/remote.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class ProductsRepositoryImp extends ProductsRepository {

  final InternetConnectionChecker internetConnectionChecker;

  final ProductsRemote remote;
  final AuthLocal local;

  ProductsRepositoryImp(this.remote, this.internetConnectionChecker,
      this.local);


  @override
  Future<Either<Failure, Unit>> addProductToFavorite(int productId) async {
    try {
      final res = await remote.addProductToFavorite(productId, local.getId()!);
      if (res) {
        return const Right(unit);
      }
      return Left(BackendFailure(""));
    }
    on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() async {
    try {
      final res = await remote.getFavoriteProducts(local.getId()!);
      if (res.isEmpty) {
        return Left(BackendFailure(""));
      }
      return Right(res);

    }
    on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      int categoryId) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final List<ProductModel>res = await remote.getProducts(
            categoryId, local.getId()!);
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

  @override
  Future<Either<Failure, Unit>> removeProductFromFavorite(int productId) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.removeProductFromFavorite(productId, local.getId()!);
        if (res) {
          return const Right(unit);

        }
        return Left(BackendFailure(""));
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
  Future<Either<Failure, List<ProductModel>>> searchProducts(String productName) async {
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


  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int productId) async{
    if (await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.getProductDetails(productId);
        if (res==null) {
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
