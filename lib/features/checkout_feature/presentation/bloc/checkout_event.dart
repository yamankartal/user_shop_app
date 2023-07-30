part of 'checkout_bloc.dart';
abstract class CheckOutEvent{}



 class CheckCouponEvent extends CheckOutEvent{
   final String couponName;
  CheckCouponEvent(this.couponName);
 }

 class DeleteCouponEvent extends CheckOutEvent{}

 class CheckOutOrderEvent extends CheckOutEvent{
  final int addressId;
  CheckOutOrderEvent( this.addressId);
 }

 class SendOrderEvent extends CheckOutEvent{

 final int orderType;
 final double orderPrice;
 final double orderTotalPrice;
 final double orderDeliveryPrice;
 final int orderPaymentMethode;
 final int orderAddressId;
 final String couponName;
  SendOrderEvent(this.orderType, this.orderPrice, this.orderTotalPrice, this.orderDeliveryPrice, this.orderPaymentMethode, this.orderAddressId, this.couponName);

}

class PaymentMethodeEvent extends CheckOutEvent{
 final int paymentMethode;
  PaymentMethodeEvent(this.paymentMethode);
}


class OrderTypeEvent extends CheckOutEvent{
 final int orderType;
 OrderTypeEvent(this.orderType);
}