import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/enums.dart';
import '../../../adress_feature/domain/use_case/get_position_case.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/order_model.dart';
import '../../domain/use_case/delete_order_case.dart';
import '../../domain/use_case/get_archived_orders.dart';
import '../../domain/use_case/get_order_details_case.dart';
import '../../domain/use_case/get_orders_case.dart';
import '../../domain/use_case/rate_order_case.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersCase getOrdersCase;
  final GetOrderDetailsCase getOrderDetailsCase;
  final DeleteOrderCase deleteOrderCase;
  final GetArchivedOrdersCase getArchivedOrdersCase;
  final RateOrderCase rateOrderCase;
  final GetPositionCase getPositionCase;

  GoogleMapController? googleMapController;

  OrdersBloc(this.getOrdersCase, this.getOrderDetailsCase, this.deleteOrderCase,
      this.getArchivedOrdersCase, this.rateOrderCase, this.getPositionCase)
      : super(OrdersState()) {
    on<GetOrdersEvent>(
      (event, emit) async {
        emit(state.copyWith(getOrdersState: States.loading));
        final res = await getOrdersCase.call(ParamGetOrders());
        res.fold(
          (l) => emit(
            state.copyWith(getOrdersState: States.error),
          ),
          (r) => emit(
            state.copyWith(
              getOrdersState: States.loaded,
              orders: List.of(r),
            ),
          ),
        );
      },
    );

    on<GetOrderDetailsEvent>(
      (event, emit) async {
        emit(state.copyWith(getOrderDetailsState: States.loading));
        final res =
            await getOrderDetailsCase.call(ParamGetOrderDetails(event.orderId));
        res.fold(
          (l) => emit(state.copyWith(getOrderDetailsState: States.error)),
          (r) => emit(
            state.copyWith(
                getOrderDetailsState: States.loaded, orderDetailsModel: r),
          ),
        );
      },
    );

    on<DeleteOrderEvent>(
      (event, emit) async {
        emit(state.copyWith(deleteOrderState: States.loading));
        final res = await deleteOrderCase
            .call(ParamDeleteOrderCase(state.orders[event.index].orderId!));
        res.fold(
          (l) => emit(state.copyWith(deleteOrderState: States.error)),
          (r) => emit(
            state.copyWith(
              deleteOrderState: States.loaded,
              orders: List.of(state.orders)..removeAt(event.index),
            ),
          ),
        );
      },
    );

    on<GetArchivedOrdersEvent>(
      (event, emit) async {
        emit(state.copyWith(getArchivedOrdersState: States.loading));
        final res = await getArchivedOrdersCase.call(ParamGetArchivedOrders());
        res.fold(
          (l) => emit(state.copyWith(getArchivedOrdersState: States.error)),
          (r) => emit(
            state.copyWith(
              getArchivedOrdersState: States.loaded,
              orders: List.of(r),
            ),
          ),
        );
      },
    );

    on<RateOrderEvent>(
      (event, emit) async {
        emit(state.copyWith(rateOrderState: States.loading));
        final res = await rateOrderCase
            .call(ParamRateOrder(event.orderId, event.rate, event.comment));
        res.fold(
          (l) => emit(state.copyWith(rateOrderState: States.error)),
          (r) {
            state.orders[event.index] =
                state.orders[event.index].copyWith(orderRating: event.rate);
            emit(
              state.copyWith(rateOrderState: States.loaded),
            );
          },
        );
      },
    );

    on<RefreshOrderStatusEvent>(
      (event, emit) {
        print("object");
        if (state.orders.isNotEmpty) {
          final int index = state.orders.indexOf(state.orders
              .firstWhere((element) => element.orderId == event.orderId));
          state.orders[index] =
              state.orders[index].copyWith(orderStatus: event.orderStatus);
          emit(
            state.copyWith(
              orders: List.of(state.orders),
            ),
          );
        }
      },
    );

    on<RefreshOrderDetailsStatusEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            orderDetailsModel: state.orderDetailsModel.copyWith(
                orderDetails: state.orderDetailsModel.orderDetails!
                    .copyWith(orderStatus: event.orderStatus)),
          ),
        );
      },
    );
  }
}
