import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:shopapp/features/home_page_feature/presentation/bloc/home_page_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import '../../../home_page_feature/presentation/screens/home_page.dart';
import '../../data/model/check_out_model.dart';
import '../bloc/checkout_bloc.dart';
import '../widget/check_out_details_widget.dart';
import '../widget/coupon_check_out_widget.dart';
import '../widget/order_payment_methode_widget.dart';
import '../widget/order_type_text_widget.dart';
import '../widget/order_type_widget.dart';
import '../widget/payment_methode_text_widget.dart';

class CheckOutScreen extends StatefulWidget {
  final int addressId;

  const CheckOutScreen({Key? key, required this.addressId}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late CheckOutBloc checkOutBloc;
  final GlobalKey<FormState> key = GlobalKey();
  final TextEditingController coupon = TextEditingController();

  @override
  void initState() {
    checkOutBloc = BlocProvider.of<CheckOutBloc>(context);
    checkOutBloc.add(CheckOutOrderEvent(widget.addressId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check out'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CheckOutBloc, CheckOutState>(
          listener: (_, state) {
            if (state.sendOrderState == States.loaded) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) =>BlocProvider(create: (_)=>sl<HomePageBloc>(),
                    child: const HomePage(),
                    )
                  ),
                  (route) => false);
            } else if (state.sendOrderState == States.error) {
              showSnackBar(context, state.errorMsg);
            }
          },
          builder: (_, state) {
            if (state.checkOutOrderStatus == States.loading) {
              return circularProgressIndicatorWidget();
            }

            if (state.checkOutOrderStatus == States.loaded) {
              return Column(
                children: [
                  const OrderTypeTextWidget(),
                  OrderTypeWidget(
                    checkOutBloc: checkOutBloc,
                  ),
                  const OrderPaymentMethodeTextWidget(),
                  OrderPaymentMethodeWidget(
                    checkOutBloc: checkOutBloc,
                  ),
                  CouponCheckOutWidget(
                      coupon: coupon, checkOutBloc: checkOutBloc),
                  const CheckOutDetailsWidget()
                ],
              );
            } else if (state.checkOutOrderStatus == States.error) {
              return const Center(child: Text('error'));
            }

            return Container();
          },
        ),
      ),
      bottomNavigationBar: MaterialButton(
        height: Res.font * 2,
        minWidth: Res.width,
        color: AppColor.primaryColors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(Res.padding),
          topLeft: Radius.circular(Res.padding),
        )),
        child: Text(
          'Send order',
          style: TextStyle(color: Colors.white, fontSize: Res.font),
        ),
        onPressed: () {
          final CheckOutModel checkOutModel = checkOutBloc.state.checkOutModel;
          checkOutBloc.add(SendOrderEvent(
              checkOutBloc.state.orderType,
              checkOutModel.orderPrice!,
              checkOutModel.totalOrderPrice(
                  checkOutBloc.state.couponModel.couponDiscount ?? 0,
                  checkOutBloc.state.orderType),
              checkOutModel.orderDeliveryPrice!,
              checkOutBloc.state.paymentMethode,
              widget.addressId,
              coupon.text));
        },
      ),
    );
  }
}
