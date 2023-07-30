
import '../../../../core/constants/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shopapp/features/products_feature/domain/use_case/products_use_case.dart';

import '../repository/repository.dart';
class RemoveFromFavoriteCase extends ProductsUseCase<Unit,ParamRemoveFromFavorite>{
  final ProductsRepository repository;
  RemoveFromFavoriteCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamRemoveFromFavorite param)async{
    return  await repository.removeProductFromFavorite(param.productId);
  }
}


class ParamRemoveFromFavorite{
  final int productId;
  ParamRemoveFromFavorite(this.productId);
}