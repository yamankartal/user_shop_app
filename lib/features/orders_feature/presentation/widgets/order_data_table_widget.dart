import 'package:flutter/material.dart';
import 'package:shopapp/features/orders_feature/data/model/order_details_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class OrderDataTableWidget extends StatelessWidget {

  final OrderDetailsModel orderDetailsModel;

  const OrderDataTableWidget({Key? key, required this.orderDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DataTable(
      columns: [
        DataColumn(
          label: Text(
            'product',
            style: TextStyle(
                color: AppColor.primaryColors,
                fontSize: Res.font,
                fontWeight: FontWeight.bold),
          ),),
        DataColumn(
          label: Text(
            'QTY',
            style: TextStyle(
                color: AppColor.primaryColors,
                fontSize: Res.font,
                fontWeight: FontWeight.bold),
          ),),
        DataColumn(
          label: Text(
            'Price',
            style: TextStyle(
                color: AppColor.primaryColors,
                fontSize: Res.font,
                fontWeight: FontWeight.bold),
          ),),
      ],
      rows: List.generate(
        orderDetailsModel.orderItems!.length,
            (index) => DataRow(
          cells: [
            DataCell(Text(orderDetailsModel
                .orderItems![index]
                .productName!)),
            DataCell(Text(orderDetailsModel
                .orderItems![index]
                .cartProductQuantity
                .toString())),
            DataCell(Text(orderDetailsModel
                .orderItems![index]
                .cartProductPrice
                .toString())),
          ],
        ),
      ),
    );
  }
}
