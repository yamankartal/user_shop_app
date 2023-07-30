
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'cart_use_case.dart';

class UpdateCartCase extends CartUseCase<Unit,ParamUpdateCart>{
  final CartRepository repository;
  UpdateCartCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamUpdateCart param)async {
    return await repository.updateCart(param.cartId, param.data);
  }
}

class ParamUpdateCart {
  final int cartId;
  final int productQuantity;

  ParamUpdateCart(this.cartId, this.productQuantity);

  Map<String,dynamic>get data{
    return {
      "product_quantity":productQuantity.toString()
    };
  }

}
