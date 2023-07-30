import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shopapp/core/constants/constants.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/convert.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../tracking_feature/presentation/screens/tracking_scrren.dart';
import '../../data/model/order_model.dart';
import '../bloc/orders_bloc.dart';
import '../screens/order_details_screen.dart';

class OrderItemWidget extends StatelessWidget {
  final FromScreen fromScreen;
  final int index;
  final OrderModel orderModel;
  final OrdersBloc ordersBloc;

  const OrderItemWidget(
      {Key? key,
      required this.index,
      required this.orderModel,
      required this.ordersBloc,
      this.fromScreen = FromScreen.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(
              "Are you sure you want to delete this order ?",
              style: TextStyle(color: Colors.black, fontSize: Res.font),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "no",
                    style: TextStyle(
                        color: AppColor.primaryColors, fontSize: Res.font),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ordersBloc.add(DeleteOrderEvent(index));
                },
                child: Text(
                  "yes",
                  style: TextStyle(
                      color: AppColor.primaryColors, fontSize: Res.font),
                ),
              ),
            ],
          ),
        );
      },
      child: SizedBox(
        height: Res.height * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Res.padding)),
          elevation: Res.padding,
          child: Padding(
            padding: EdgeInsets.all(Res.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Res.padding * 0.5,
                ),
                Row(
                  children: [
                    Text(
                      'Order Number : ${orderModel.orderId!}',
                      style: TextStyle(
                          fontSize: Res.font, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (fromScreen == FromScreen.orders &&
                        orderModel.orderStatus == 3)
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Res.padding)),
                          color: AppColor.primaryColors,
                          onPressed: () {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                      builder: (_) => const TrackingScreen()),
                                )
                                .then((value) => screen = Screen.orderDetails);
                          },
                          child: Text(
                            "Tracking",
                            style: TextStyle(
                                color: Colors.white, fontSize: Res.font * 0.8),
                          )),
                    if (fromScreen == FromScreen.archivedOrders &&
                        orderModel.orderRating == 0)
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Res.padding)),
                          color: AppColor.primaryColors,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => RatingDialog(
                                      starSize: Res.font * 1.7,
                                      initialRating: 1,
                                      // your app's name?
                                      title: const Text(
                                        'Order rating',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      starColor: AppColor.primaryColors,
                                      submitButtonText: 'rate',
                                      submitButtonTextStyle: TextStyle(
                                          color: AppColor.primaryColors,
                                          fontSize: Res.font,
                                          fontWeight: FontWeight.bold),
                                      commentHint: '',

                                      onSubmitted: (response) {
                                        ordersBloc.add(RateOrderEvent(
                                            orderModel.orderId!,
                                            response.rating.toInt(),
                                            response.comment,
                                            index));
                                      },
                                    ));
                          },
                          child: Text(
                            "Rating",
                            style: TextStyle(
                                color: Colors.white, fontSize: Res.font * 0.8),
                          ))
                  ],
                ),
                SizedBox(
                  height: Res.padding,
                ),
                Column(
                  children: [
                    Text(
                      "order status : ${convertIntoOrderStatus(orderModel.orderStatus!)}",
                      style: TextStyle(
                          color: Colors.black54, fontSize: Res.font * 0.9),
                    ),
                    SizedBox(
                      height: Res.padding,
                    ),
                  ],
                ),
                Text(
                  "order date : ${orderModel.orderDateTime!.day!}/"
                  "${orderModel.orderDateTime!.month}/"
                  "${orderModel.orderDateTime!.year}",
                  style: TextStyle(
                      color: Colors.black54, fontSize: Res.font * 0.9),
                ),
                SizedBox(
                  height: Res.padding,
                ),
                Text(
                  'order time :   ${orderModel.orderDateTime!.hour}:${orderModel.orderDateTime!.minute}',
                  style: TextStyle(
                      color: Colors.black54, fontSize: Res.font * 0.9),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total price : ${orderModel.orderTotalPrice!} \$",
                      style: TextStyle(
                          color: AppColor.primaryColors,
                          fontSize: Res.font * 0.9,
                          fontWeight: FontWeight.bold),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Res.padding)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: ordersBloc,
                              child: OrderDetailsScreen(
                                fromScreen: fromScreen,
                                index: index,
                                orderId: orderModel.orderId!,
                              ),
                            ),
                          ),
                        ).then((value) => screen=Screen.orders);
                      },
                      color: AppColor.primaryColors,
                      child: Text(
                        'Details',
                        style: TextStyle(
                            color: Colors.white, fontSize: Res.font * 0.8),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
