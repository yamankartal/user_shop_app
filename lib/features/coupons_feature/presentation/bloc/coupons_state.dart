part of 'coupons_bloc.dart';

class CouponsState{
  final States getCouponsState;
  final List<CouponModel>coupons;
  final String errorMsg;
  CouponsState({this.errorMsg='',this.getCouponsState=States.init, this.coupons=const[]});


  CouponsState copyWith({


    final States? getCouponsState,
    final List<CouponModel>?coupons,
    final String? errorMsg,
}){

    return CouponsState(
      getCouponsState: getCouponsState??this.getCouponsState,
      coupons: coupons??this.coupons,
      errorMsg: errorMsg??this.errorMsg
    );

  }

}