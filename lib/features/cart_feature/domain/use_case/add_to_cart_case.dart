
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'cart_use_case.dart';

class AddToCartCase extends CartUseCase<Unit,ParamAddCarts>{
  final CartRepository repository;
  AddToCartCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamAddCarts param)async {
    return await repository.addProductToCart(param.productId, param.data);
  }
}

class ParamAddCarts{
  final int productId;
  final int productQuantity;
  final double productPrice;
  ParamAddCarts(this.productId, this.productQuantity, this.productPrice);

 Map<String,dynamic>get data{
   return {
     "product_price":productPrice.toString(),
     "product_quantity":productQuantity.toString(),

   };
 }

}