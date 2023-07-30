
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';


import '../../data/model/cart_model.dart';
import '../repository/repository.dart';
import 'cart_use_case.dart';

class GetCartCase extends CartUseCase<List<CartModel>,ParamGetCart>{
  final CartRepository repository;
  GetCartCase(this.repository);

  @override
  Future<Either<Failure, List<CartModel>>> call(ParamGetCart param)async {
    return await repository.getCart();
  }
}

class ParamGetCart{

}