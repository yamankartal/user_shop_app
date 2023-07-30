import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'orders_use_case.dart';
import '../repository/repository.dart';

class RateOrderCase extends OrdersUseCase<bool,ParamRateOrder>{
  final OrdersRepository repository;
  RateOrderCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamRateOrder param)async{
    return await repository.rateOrder(param.orderId,param.data);
  }

}
class ParamRateOrder{
  final int orderId;
  final int rate;
  final String comment;
  ParamRateOrder(this.orderId, this.rate, this.comment);

  Map<String,dynamic> get data{
    return{
      'order_rating':rate.toString(),
      'order_comment':comment.toString(),
    };
  }
}