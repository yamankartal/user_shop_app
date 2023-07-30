part of 'checkout_bloc.dart';

class CheckOutState {
  final States checkCouponState;
  final States sendOrderState;
  final States checkOutOrderStatus;
  final CouponModel couponModel;
  final CheckOutModel checkOutModel;
  final int paymentMethode;
  final int orderType ;

  final String errorMsg;




  CheckOutState(
      {
        this.errorMsg="",
        this.orderType=0,
        this.paymentMethode=0,
        this.checkCouponState = States.init,
      this.sendOrderState = States.init,
      this.checkOutOrderStatus = States.init,
      this.couponModel = const CouponModel(),
      this.checkOutModel = const CheckOutModel()});

  CheckOutState copyWith({
    final int? paymentMethode,
    final States? checkCouponState,
    final States?  sendOrderState,
    final States?  checkOutOrderStatus,
    final CouponModel ? couponModel,
    final CheckOutModel ? checkOutModel,
    final int? orderType ,
    final String? errorMsg
  }) {
    return CheckOutState(
      checkCouponState: checkCouponState ?? this.checkCouponState,
      couponModel: couponModel ?? this.couponModel,
      sendOrderState: sendOrderState??this.sendOrderState,
      checkOutModel: checkOutModel??this.checkOutModel,
      checkOutOrderStatus: checkOutOrderStatus??this.checkOutOrderStatus,
      paymentMethode: paymentMethode??this.paymentMethode,
      orderType: orderType??this.orderType,
      errorMsg: errorMsg??this.errorMsg

    );
  }
}
