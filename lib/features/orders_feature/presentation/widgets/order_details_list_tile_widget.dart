import 'package:flutter/material.dart';
import 'package:shopapp/features/orders_feature/data/model/order_details_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class OrderDetailsListTileWidget extends StatelessWidget {
  final String label;
  final String trailingText;
  final OrderDetailsModel orderDetailsModel;

  const OrderDetailsListTileWidget({Key? key, required this.orderDetailsModel, required this.label, required this.trailingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(fontSize: Res.font * 0.9),
      ),
      trailing: Text(
          trailingText,
        style: const TextStyle(
            color: AppColor.primaryColors,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
//