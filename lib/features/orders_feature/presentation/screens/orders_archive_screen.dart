import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'package:shopapp/features/orders_feature/presentation/widgets/order_item_widget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';


class OrdersArchiveScreen extends StatefulWidget {
  const OrdersArchiveScreen({Key? key}) : super(key: key);

  @override
  State<OrdersArchiveScreen> createState() => _OrdersArchiveScreenState();
}

class _OrdersArchiveScreenState extends State<OrdersArchiveScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetArchivedOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColors,
        title: const Text('archive'),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (_, state) {
          if (state.getArchivedOrdersState == States.loading) {
            return circularProgressIndicatorWidget();
          } else if (state.getArchivedOrdersState == States.loaded) {
            return BlocConsumer<OrdersBloc,OrdersState>(

                buildWhen: (p,c)=>p.deleteOrderState!=c.deleteOrderState||p.rateOrderState!=c.rateOrderState,
                builder: (_,state){
              if(state.deleteOrderState==States.loading||state.rateOrderState==States.loading){
                return circularProgressIndicatorWidget();
              }

              return ListView.separated(
                  padding: EdgeInsets.all(Res.padding),
                  itemBuilder: (_, index) =>  OrderItemWidget(
                    fromScreen: FromScreen.archivedOrders,
                    index: index,
                    ordersBloc: ordersBloc,
                    orderModel: state.orders[index],
                  ),
                  separatorBuilder: (_, index) => SizedBox(
                    height: Res.padding,
                  ),
                  itemCount: state.orders.length);

            }, listener: (_,state){
                  if(state.deleteOrderState==States.error){}

                  else if(state.rateOrderState==States.error){}

            });
          } else if (state.getArchivedOrdersState == States.error) {
            return errorWidget(state.errorMsg);
          }
          return Container();
        },
      ),
    );
  }
}
