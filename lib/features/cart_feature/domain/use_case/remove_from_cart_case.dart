
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'cart_use_case.dart';

class RemoveFromCartCase extends CartUseCase<Unit,ParamRemoveFromCart>{
  final CartRepository repository;
  RemoveFromCartCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamRemoveFromCart param)async {
    return await repository.removeProductFromCart(param.cartId);
  }
}

class ParamRemoveFromCart{

  final int cartId;
  ParamRemoveFromCart(this.cartId);
}