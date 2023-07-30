import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'checkout_use_case.dart';

class SendOrderCase extends CheckOutUseCase<Unit,ParamSendOrder>{

  final CheckOutRepository repository;
  SendOrderCase(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamSendOrder param) async{
    return await repository.sendOrder(param.data);
  }
}


class ParamSendOrder{

  final int orderType;
  final double orderPrice;
  final double orderTotalPrice;
  final double orderDeliveryPrice;
  final int orderPaymentMethode;
  final int orderAddressId;
  final String couponName;
  ParamSendOrder(this.orderType, this.orderPrice, this.orderTotalPrice, this.orderDeliveryPrice, this.orderPaymentMethode, this.orderAddressId, this.couponName);

  Map<String,dynamic>get data{
    return {
      'order_type':orderType.toString(),
      'order_price':orderPrice.toString(),
      'order_total_price':orderTotalPrice.toString(),
      'order_delivery_price':orderDeliveryPrice.toString(),
      'order_payment_methode':orderPaymentMethode.toString(),
      'order_address_id':orderAddressId.toString(),
      'coupon_name':couponName.toString(),
    };
}
}