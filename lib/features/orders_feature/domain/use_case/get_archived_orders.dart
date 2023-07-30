import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import '../../data/model/order_model.dart';
import 'orders_use_case.dart';
import '../repository/repository.dart';
class GetArchivedOrdersCase extends OrdersUseCase<List<OrderModel>,ParamGetArchivedOrders>{
  final OrdersRepository repository;
  GetArchivedOrdersCase(this.repository);

  @override
  Future<Either<Failure, List<OrderModel>>> call(ParamGetArchivedOrders param)async {
    return await repository.getArchivedOrders();
  }
}

class ParamGetArchivedOrders{

}