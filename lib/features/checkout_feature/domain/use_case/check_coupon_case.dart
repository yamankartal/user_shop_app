import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../../../coupons_feature/data/model/coupon_model.dart';
import '../repository/repository.dart';
import 'checkout_use_case.dart';

class CheckCouponCase extends CheckOutUseCase<CouponModel,ParamCheckCoupon>{

  final CheckOutRepository repository;
  CheckCouponCase(this.repository);
  @override
  Future<Either<Failure, CouponModel>> call(ParamCheckCoupon param) async{
    return await repository.checkCoupon(param.data);
  }
}


class ParamCheckCoupon{
  final String name;
  ParamCheckCoupon(this.name);
  Map<String,dynamic>get data{
    return {
      "coupon_name":name
    };
  }
}