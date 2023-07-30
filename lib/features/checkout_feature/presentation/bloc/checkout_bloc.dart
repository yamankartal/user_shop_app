import 'package:bloc/bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../coupons_feature/data/model/coupon_model.dart';
import '../../data/model/check_out_model.dart';
import '../../domain/use_case/checkOutOrderCase.dart';
import '../../domain/use_case/check_coupon_case.dart';
import '../../domain/use_case/send_order_case.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';


class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  final CheckCouponCase checkCouponCase;
  final CheckOutOrderCase checkOutOrderCase;
  final SendOrderCase sendOrderCase;

  CheckOutBloc(this.checkCouponCase, this.checkOutOrderCase, this.sendOrderCase)
      : super(CheckOutState()) {

on<DeleteCouponEvent>((event, emit){
  emit(state.copyWith(checkCouponState: States.init,couponModel: state.couponModel.copyWith(couponDiscount: 0)));
});


    on<CheckCouponEvent>((event, emit) async {
      emit(state.copyWith(checkCouponState: States.loading));
      final res =
          await checkCouponCase.call(ParamCheckCoupon(event.couponName));
      res.fold((l) {
        emit(state.copyWith(checkCouponState: States.error,couponModel: state.couponModel.copyWith(couponDiscount: 0)));
      }, (r) {
        emit(state.copyWith(
          checkCouponState: States.loaded,
          couponModel: r
        ));
      });
      if(state.checkCouponState==States.error){
        emit(state.copyWith(checkCouponState: States.init));
      }
    });



    on<SendOrderEvent>((event, emit) async {
      emit(state.copyWith(sendOrderState: States.loading));
      final res = await sendOrderCase.call(
          ParamSendOrder(
            event.orderType,
            event.orderPrice,
            event.orderTotalPrice,
            event.orderDeliveryPrice,
            event.orderPaymentMethode,
            event.orderAddressId,
            event.couponName,


          ));
      res.fold((l) => emit(state.copyWith(sendOrderState: States.error)),
          (r) => emit(state.copyWith(sendOrderState: States.loaded)));
    });



    on<CheckOutOrderEvent>((event, emit) async {
      emit(state.copyWith(checkOutOrderStatus: States.loading));
      final res = await checkOutOrderCase.call(
          ParamCheckOutOrder(
            event.addressId,
          ));
      res.fold((l) => emit(state.copyWith(checkOutOrderStatus: States.error)),
          (r) => emit(state.copyWith(checkOutOrderStatus: States.loaded,checkOutModel: r)));
    });


    on<PaymentMethodeEvent>((event, emit) async {
      emit(state.copyWith(paymentMethode: event.paymentMethode));
    });


    on<OrderTypeEvent>((event, emit) async {
      emit(state.copyWith(orderType: event.orderType));
    });



  }
}
