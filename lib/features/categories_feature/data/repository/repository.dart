import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';


import 'package:shopapp/features/categories_feature/data/model/category_model.dart';

import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import '../sources/remote.dart';

class CategoriesRepositoryImp extends CategoriesRepository{
  final CategoriesRemote remote;
  CategoriesRepositoryImp(this.remote);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async{
   try{
     final res=await remote.getCategories();
     if(res.isEmpty){
       return Left(BackendFailure(""));
     }
     return Right(res);
   }
       on ServerException{
     return Left(ServerFailure());
       }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> searchCategories(String categoryName) async{
    try{
      final res=await remote.searchCategories(categoryName);
      if(res.isEmpty){
        return Left(BackendFailure(""));
      }
      return Right(res);
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

}