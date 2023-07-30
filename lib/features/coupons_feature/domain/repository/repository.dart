import 'package:dartz/dartz.dart';
import 'package:shopapp/features/coupons_feature/data/model/coupon_model.dart';

import '../../../../core/constants/failures.dart';


abstract class CouponsRepository{
  Future<Either<Failure,List<CouponModel>>>getCoupons();
}