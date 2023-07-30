import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/constants.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/orders_bloc.dart';
import '../widgets/order_data_table_widget.dart';
import '../widgets/order_details_list_tile_widget.dart';
import '../widgets/order_status_widget.dart';
import '../widgets/resend_order_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;
  final int index;
  final FromScreen fromScreen;

  const OrderDetailsScreen(
      {Key? key,
      required this.orderId,
      required this.index,
      this.fromScreen = FromScreen.orders})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    screen=Screen.orderDetails;
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetOrderDetailsEvent(widget.orderId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order details'),
          backgroundColor: AppColor.primaryColors,
        ),
        body: Container(
          margin: EdgeInsets.only(top: Res.padding),
          width: Res.width,
          height: Res.height,
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (_, state) {
              if (state.getOrderDetailsState == States.loading) {
                return circularProgressIndicatorWidget();
              } else if (state.getOrderDetailsState == States.loaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Res.padding * 0.5),
                        width: Res.width,
                        child: Card(
                          elevation: Res.padding * 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Res.font * 0.7),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Res.height * 0.3,
                                child: ListView(
                                  children: [
                                    OrderDataTableWidget(
                                      orderDetailsModel:
                                          state.orderDetailsModel,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.fromScreen == FromScreen.orders)
                        const OrderStatusWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Res.padding),
                        child: Column(
                          children: [
                            OrderDetailsListTileWidget(
                              orderDetailsModel: state.orderDetailsModel,
                              label: "Address",
                              trailingText:
                                  '${state.orderDetailsModel.orderDetails!.addressCity}  ${state.orderDetailsModel.orderDetails!.addressStreet}',
                            ),
                            OrderDetailsListTileWidget(
                              orderDetailsModel: state.orderDetailsModel,
                              label: "order price",
                              trailingText:
                                  '${state.orderDetailsModel.orderDetails!.orderPrice}',
                            ),
                            OrderDetailsListTileWidget(
                              orderDetailsModel: state.orderDetailsModel,
                              label: "delivery price",
                              trailingText:
                                  '${state.orderDetailsModel.orderDetails!.orderDeliveryPrice} \$',
                            ),
                            OrderDetailsListTileWidget(
                              orderDetailsModel: state.orderDetailsModel,
                              label: 'coupon discount',
                              trailingText:
                                  '${state.orderDetailsModel.orderCoupon!.couponOrderDiscount((state.orderDetailsModel.orderDetails!.orderDeliveryPrice! + state.orderDetailsModel.orderDetails!.orderPrice!))} \$ ',
                            ),
                            OrderDetailsListTileWidget(
                              orderDetailsModel: state.orderDetailsModel,
                              label: 'total price',
                              trailingText:
                                  '${state.orderDetailsModel.orderDetails!.orderTotalPrice}',
                            ),
                          ],
                        ),
                      ),
                      //Spacer(),
                    ],
                  ),
                );
              } else if (state.getOrderDetailsState == States.error) {
                return const Center(
                  child: Text('error'),
                );
              }
              return Container();
            },
          ),
        ),
        bottomNavigationBar: widget.fromScreen == FromScreen.archivedOrders
            ? const ResendOrderWidget()
            : null);
  }
}
