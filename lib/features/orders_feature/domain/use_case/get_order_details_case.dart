import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'orders_use_case.dart';
import '../repository/repository.dart';

import '../../data/model/order_details_model.dart';

class GetOrderDetailsCase extends OrdersUseCase<OrderDetailsModel,ParamGetOrderDetails>{
 final OrdersRepository repository;
  GetOrderDetailsCase(this.repository);

  @override
  Future<Either<Failure, OrderDetailsModel>> call(param) async{
    return await repository.getOrderDetails(param.orderId);
  }
}


class ParamGetOrderDetails{
  final int orderId;
  ParamGetOrderDetails(this.orderId);
}