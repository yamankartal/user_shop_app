import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/checkout_bloc.dart';
import '../screens/paypal_screen.dart';

class OrderPaymentMethodeWidget extends StatelessWidget {
  final CheckOutBloc checkOutBloc;

  const OrderPaymentMethodeWidget({
    Key? key,
    required this.checkOutBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutBloc, CheckOutState>(
      buildWhen: (p, c) => p.paymentMethode != c.paymentMethode,
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                checkOutBloc.add(PaymentMethodeEvent(0));
              },
              child: Container(
                margin: EdgeInsets.only(top: Res.padding),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/money.png'
                    )
                  ),
                  borderRadius: BorderRadius.circular(Res.padding),
                  border: Border.all(
                      color: state.paymentMethode == 0
                          ? AppColor.primaryColors
                          : Colors.black),
                ),
                width: Res.width * 0.4,
                height:state.orderType==0?Res.height * 0.16:Res.height*0.14,

              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const PayPalScreen()));
                checkOutBloc.add(PaymentMethodeEvent(1));
              },
              child: Container(

                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/atm-card.png'
                      )
                  ),
                  borderRadius: BorderRadius.circular(Res.padding),
                  border: Border.all(
                      color: state.paymentMethode == 1
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
