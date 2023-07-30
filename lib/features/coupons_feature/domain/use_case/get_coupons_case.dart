import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';


import 'package:shopapp/features/coupons_feature/data/model/coupon_model.dart';
import 'package:shopapp/features/coupons_feature/domain/repository/repository.dart';
import 'package:shopapp/features/coupons_feature/domain/use_case/use_case.dart';

class GetCouponsCase extends CouponsUseCase<List<CouponModel>,ParamGetCoupons>{

  final CouponsRepository repository;
  GetCouponsCase(this.repository);

  @override
  Future<Either<Failure, List<CouponModel>>> call(ParamGetCoupons param)async{
    return await repository.getCoupons();
  }



}

class ParamGetCoupons{

}