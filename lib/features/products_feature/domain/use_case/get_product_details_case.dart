import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../../data/model/product_details_model.dart';

import '../repository/repository.dart';
import 'products_use_case.dart';

class GetProductDetailsCase extends ProductsUseCase<ProductDetailsModel,ParamGetProductDetails>{

  final ProductsRepository repository;
  GetProductDetailsCase(this.repository);
  @override
  Future<Either<Failure, ProductDetailsModel>> call(ParamGetProductDetails param) async{
    return await repository.getProductDetails(param.productId);
  }
}


class ParamGetProductDetails{
  final int productId;
  ParamGetProductDetails(this.productId);
}