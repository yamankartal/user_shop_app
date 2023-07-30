
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'cart_use_case.dart';

class DiscountFromCartCase extends CartUseCase<Unit,ParamDiscountItemFromCart>{
  final CartRepository repository;
  DiscountFromCartCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamDiscountItemFromCart param)async {
    return await repository.decreaseProductQuantityFromCart(param.productId);
  }
}

class ParamDiscountItemFromCart{
  final int productId  ;
  ParamDiscountItemFromCart(this.productId);
}