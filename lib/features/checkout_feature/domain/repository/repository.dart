import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../../coupons_feature/data/model/coupon_model.dart';
import '../../data/model/check_out_model.dart';

abstract class CheckOutRepository{
   Future<Either<Failure,CouponModel>>checkCoupon(Map<String,dynamic>data);
   Future<Either<Failure,CheckOutModel>>checkOutOrder(Map<String,dynamic>data);
   Future<Either<Failure,Unit>>sendOrder(Map<String,dynamic>data);
}