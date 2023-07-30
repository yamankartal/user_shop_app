import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/orders_feature/presentation/bloc/orders_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/responsive.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Res.font, top: Res.padding),
              child: Text(
                'Order status',
                style: TextStyle(
                    fontSize: Res.font, color: AppColor.primaryColors),
              ),
            ),
          ],
        ),
        BlocBuilder<OrdersBloc, OrdersState>(
            buildWhen: (p, c) => p.orderDetailsModel != c.orderDetailsModel,
            builder: (_, state) => Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Res.padding, vertical: Res.padding),
                padding: EdgeInsets.symmetric(
                    vertical: Res.font*0.8, horizontal: Res.padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Res.padding),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Res.font * 0.8,
                          backgroundColor: orderStatusColor(
                              state.orderDetailsModel.orderDetails!.orderStatus,
                              0),
                        ),
                        Container(
                          height: Res.tinyFont,
                          width: Res.width * 0.162,
                          color: orderStatusColor(
                            state.orderDetailsModel.orderDetails!.orderStatus,
                            0,
                          ),
                        ),
                        CircleAvatar(
                          radius: Res.font * 0.8,
                          backgroundColor: orderStatusColor(
                              state.orderDetailsModel.orderDetails!.orderStatus,
                              1),
                        ),
                        Container(
                          height: Res.tinyFont,
                          width: Res.width * 0.162,
                          color: orderStatusColor(
                            state.orderDetailsModel.orderDetails!.orderStatus,
                            1,
                          ),
                        ),
                        CircleAvatar(
                          radius: Res.font * 0.8,
                          backgroundColor: orderStatusColor(
                              state.orderDetailsModel.orderDetails!.orderStatus,
                              2),
                        ),
                        Container(
                          height: Res.tinyFont,
                          width: Res.width * 0.162,
                          color: orderStatusColor(
                            state.orderDetailsModel.orderDetails!.orderStatus,
                            2,
                          ),
                        ),
                        CircleAvatar(
                          radius: Res.font * 0.8,
                          backgroundColor: orderStatusColor(
                              state.orderDetailsModel.orderDetails!.orderStatus,
                              3),
                        ),
                      ],
                    ),
                    DefaultTextStyle(
                      style: TextStyle(color: Colors.black,height: Res.tinyFont,fontSize: Res.font*0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("pending"),
                          Text("preparing"),
                          Text(state.orderDetailsModel.orderDetails!.orderType==0?"onTheWay":"onReceiving"),
                          Text("receiving"),
                        ],
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}
