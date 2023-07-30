import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../../data/model/products_model.dart';
import '../repository/repository.dart';
import 'products_use_case.dart';

class SearchProductsCase extends ProductsUseCase<List<ProductModel>,ParamSearchProducts>{
  final ProductsRepository repository;
  SearchProductsCase(this.repository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(ParamSearchProducts param)async{
    return await repository.searchProducts(param.productName);
  }
}


class ParamSearchProducts{
  final String productName;
  ParamSearchProducts(this.productName);
}