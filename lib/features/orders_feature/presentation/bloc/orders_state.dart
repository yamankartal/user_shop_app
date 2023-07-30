part of 'orders_bloc.dart';

class OrdersState {
  final States getOrdersState;
  final List<OrderModel> orders;
  final OrderDetailsModel orderDetailsModel;
  final States getOrderDetailsState;
  final States deleteOrderState;
  final States getArchivedOrdersState;
  final States rateOrderState;

  final String errorMsg;

  OrdersState({this.errorMsg="",this.rateOrderState=States.init,this.getArchivedOrdersState=States.init,this.deleteOrderState=States.init,this.getOrdersState = States.init, this.orders = const [],this.getOrderDetailsState=States.init,this.orderDetailsModel=const OrderDetailsModel()});

  OrdersState copyWith({
    final States? rateOrderState,
    final States?getArchivedOrdersState,
    final States ?deleteOrderState,
    final States?getOrderDetailsState,
    final OrderDetailsModel? orderDetailsModel,
    final States? getOrdersState,
    final List<OrderModel>? orders,
    final String ?errorMsg,

  }) {
    return OrdersState(
      rateOrderState: rateOrderState??this.rateOrderState,
      getArchivedOrdersState: getArchivedOrdersState??this.getArchivedOrdersState,
      deleteOrderState: deleteOrderState??this.deleteOrderState,
      getOrderDetailsState: getOrderDetailsState??this.getOrderDetailsState,
      orderDetailsModel: orderDetailsModel??this.orderDetailsModel,
      getOrdersState: getOrdersState ?? this.getOrdersState,
      orders: orders ?? this.orders,
      errorMsg: errorMsg??this.errorMsg,
    );
  }
}
