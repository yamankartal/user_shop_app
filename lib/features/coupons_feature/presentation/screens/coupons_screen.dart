import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../home_feature/presentation/widgets/coupon_item_widget.dart';
import '../bloc/coupons_bloc.dart';
import '../widgets/coupon_item_widget.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {


  late CouponsBloc couponsBloc;

  @override
  void initState() {
    couponsBloc=BlocProvider.of<CouponsBloc>(context);
    couponsBloc.add(GetCouponsEvent());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColors,
          title: const Text('Coupons'),
        ),
        body: BlocBuilder<CouponsBloc, CouponsState>(
          builder: (_, state) {
            if (state.getCouponsState == States.loading) {
              return circularProgressIndicatorWidget();
            } else if (state.getCouponsState == States.loaded) {

              return ListView.separated(
                padding: EdgeInsets.all(Res.padding),
                  itemBuilder: (_, index) => CouponItemWidget(couponModel: state.coupons[index],),
                  separatorBuilder: (_, index) => SizedBox(
                    height: Res.font,
                  ),
                  itemCount: state.coupons.length);
            } else if (state.getCouponsState == States.error) {
              return errorWidget("error");
            }

            return Container();
          },
        ));
  }
}
