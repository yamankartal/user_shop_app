import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/checkout_bloc.dart';

class OrderTypeWidget extends StatelessWidget {
  final CheckOutBloc checkOutBloc;

  const OrderTypeWidget({Key? key, required this.checkOutBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutBloc, CheckOutState>(
      buildWhen: (p, c) => p.orderType != c.orderType,
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                checkOutBloc.add(OrderTypeEvent(0));
              },
              child: Container(
                margin: EdgeInsets.only(top: Res.padding*0.5),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/delivery.png'
                      )
                  ),
                  borderRadius: BorderRadius.circular(Res.padding),
                  border: Border.all(
                      color: state.orderType == 0
                          ? AppColor.primaryColors
                          : Colors.black),
                ),
                width: Res.width * 0.4,
                height:state.orderType==0?Res.height * 0.16:Res.height*0.14,
              ),
            ),
            InkWell(
              onTap: () {
                checkOutBloc.add(OrderTypeEvent(1));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/received (1).png'
                    )
                  ),
                  borderRadius: BorderRadius.circular(Res.padding),
                  border: Border.all(
                      color: state.orderType == 1
                          ? AppColor.primaryColors
                          : Colors.black),
                ),

                width: Res.width * 0.4,
                height:state.orderType==1?Res.height * 0.16:Res.height*0.14,

              ),
            ),
          ],
        );
      },
    );
  }
}
