import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';
import 'orders_use_case.dart';

class DeleteOrderCase extends OrdersUseCase<bool,ParamDeleteOrderCase>{
  final OrdersRepository repository;
  DeleteOrderCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamDeleteOrderCase param)async {
    return await repository.deleteOrder(param.orderId);
  }
}

class ParamDeleteOrderCase{
  final int orderId;
  ParamDeleteOrderCase(this.orderId);
}