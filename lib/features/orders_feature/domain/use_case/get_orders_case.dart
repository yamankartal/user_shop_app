import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';
import 'orders_use_case.dart';

class GetOrdersCase extends OrdersUseCase<List<OrderModel>,ParamGetOrders>{

  final OrdersRepository repository;
  GetOrdersCase(this.repository);
  @override
  Future<Either<Failure, List<OrderModel>>> call(ParamGetOrders param) async{
    return await repository.getOrders();
  }

}


class ParamGetOrders{}