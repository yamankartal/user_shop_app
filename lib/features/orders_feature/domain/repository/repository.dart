import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/order_model.dart';
import '../../data/model/order_details_model.dart';

abstract class OrdersRepository{
  Future<Either<Failure,List<OrderModel>>>getOrders();
  Future<Either<Failure,List<OrderModel>>>getArchivedOrders();
  Future<Either<Failure,OrderDetailsModel>>getOrderDetails(int orderId);
  Future<Either<Failure,bool>>deleteOrder(int orderId);
  Future<Either<Failure,bool>>rateOrder(int orderId,Map<String,dynamic>data);
  Future<Either<Failure,Position>>getPosition();
}