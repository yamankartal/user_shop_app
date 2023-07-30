import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import 'package:shopapp/features/products_feature/domain/use_case/products_use_case.dart';

import '../../data/model/products_model.dart';
import '../repository/repository.dart';

class GetFavoriteProductsCase extends ProductsUseCase<List<ProductModel>,ParamGetFavoriteProducts>{

 final ProductsRepository repository;
 GetFavoriteProductsCase(this.repository);
  @override
  Future<Either<Failure, List<ProductModel>>> call(ParamGetFavoriteProducts param)async {
    return await repository.getFavoriteProducts();
  }
}



class ParamGetFavoriteProducts{


}