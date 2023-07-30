part of'orders_bloc.dart';


class OrdersEvent{}


class GetOrdersEvent extends OrdersEvent{}

class GetOrderDetailsEvent extends OrdersEvent{
  final int orderId;
  GetOrderDetailsEvent(this.orderId);
}

class DeleteOrderEvent extends OrdersEvent{
  final int index;
  DeleteOrderEvent(this.index);
}

class GetArchivedOrdersEvent extends OrdersEvent{

}

class RefreshOrderStatusEvent extends OrdersEvent{
  final int orderId;
  final int orderStatus;
  RefreshOrderStatusEvent(this.orderId, this.orderStatus);
}

class RefreshOrderDetailsStatusEvent extends OrdersEvent{
  final int orderStatus;

  RefreshOrderDetailsStatusEvent( this.orderStatus);
}


class RateOrderEvent extends OrdersEvent{
  final int orderId;
  final int rate;
  final String comment;
  final int index;
  RateOrderEvent(this.orderId, this.rate, this.comment, this.index);
}

class GetCuurentPositionEvent extends OrdersEvent{}

class GetDeliveryLocation extends OrdersEvent{
  final double lat;
  final double long;

  GetDeliveryLocation(this.lat, this.long);
}
class GoToCurrentLocation extends OrdersEvent{

}