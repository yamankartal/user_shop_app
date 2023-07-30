import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/orders_bloc.dart';
import '../widgets/order_item_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    screen = Screen.orders;
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetOrdersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColors,
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (p, c) => p.getOrdersState != c.getOrdersState,
        builder: (_, state) {
          if (state.getOrdersState == States.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red.shade900,
              ),
            );
          } else if (state.getOrdersState == States.loaded) {
            return BlocConsumer<OrdersBloc, OrdersState>(
              buildWhen: (p, c) => p.deleteOrderState != c.deleteOrderState,
              builder: (_, state) {
                if (state.deleteOrderState == States.loading) {
                  return circularProgressIndicatorWidget();
                }
                return ListView.separated(
                    padding: EdgeInsets.symmetric(
                        vertical: Res.font, horizontal: Res.padding),
                    itemBuilder: (_, index) => BlocBuilder<OrdersBloc,OrdersState>(
                      buildWhen: (p,c)=>p.orders!=c.orders,
                      builder: (_,state)=>
                        OrderItemWidget(
                          fromScreen: FromScreen.orders,
                          index: index,
                          orderModel: state.orders[index],
                          ordersBloc: ordersBloc,
                        ),),
                    separatorBuilder: (_, index) => SizedBox(
                          height: Res.padding,
                        ),
                    itemCount: state.orders.length);
              },
              listener: (_, state) {
                if (state.deleteOrderState == States.error) {
                  showSnackBar(context, "error delete");
                }
              },
            );
          } else if (state.getOrdersState == States.error) {
            return const Center(
              child: Text('error'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
