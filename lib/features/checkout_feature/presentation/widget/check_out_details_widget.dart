import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/checkout_bloc.dart';
import 'check_out_details_item_widget.dart';

class CheckOutDetailsWidget extends StatelessWidget {
  const CheckOutDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: Res.font),
      child: BlocBuilder<CheckOutBloc,CheckOutState>(
        buildWhen: (p,c)=>p.checkCouponState!=c.checkCouponState||p.orderType!=c.orderType,
        builder: (_,state){
          return  Column(
            children: [
              CheckOutDetailsItemWidget(checkOutModel: state.checkOutModel,label: "order price",trailingText:"${state.checkOutModel.orderPrice!.roundToDouble()} \$", ),
              CheckOutDetailsItemWidget(checkOutModel: state.checkOutModel,label: 'couponDiscount',trailingText:"${state.couponModel.couponOrderDiscount(state.checkOutModel.orderPrice!).roundToDouble()} \$", ),
              CheckOutDetailsItemWidget(checkOutModel: state.checkOutModel,label: 'order delivery price',trailingText:'${state.orderType==1?"0":state.checkOutModel.orderDeliveryPrice} \$' ),
              CheckOutDetailsItemWidget(checkOutModel: state.checkOutModel,label:'order total price',trailingText:'${state.checkOutModel.totalOrderPrice(state.couponModel.couponDiscount??0,state.orderType).roundToDouble()} \$', ),
            ],
          );
        },
      ),
    );
  }
}
