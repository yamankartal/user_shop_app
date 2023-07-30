import '../../../../core/constants/failures.dart';

import 'package:dartz/dartz.dart';

import '../repository/repository.dart';
import 'products_use_case.dart';
class AddProductToFavoriteCase extends ProductsUseCase<Unit,ParamAddProductToFavorite>{
  final ProductsRepository repository;
  AddProductToFavoriteCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamAddProductToFavorite param)async{
    return  await repository.addProductToFavorite(param.productId);
  }
}


class ParamAddProductToFavorite{
  final int productId;
  ParamAddProductToFavorite(this.productId);
}