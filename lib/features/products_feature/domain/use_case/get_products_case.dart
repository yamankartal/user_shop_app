import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/products_model.dart';
import '../repository/repository.dart';
import 'products_use_case.dart';

class GetProductsCase extends ProductsUseCase<List<ProductModel>,ParamGetProducts>{

  final ProductsRepository repository;
  GetProductsCase(this.repository);
  @override
  Future<Either<Failure, List<ProductModel>>> call(ParamGetProducts param) async{
    return await repository.getProducts(param.categoryId);
  }
}


class ParamGetProducts{
  final int categoryId;
  ParamGetProducts(this.categoryId);
}