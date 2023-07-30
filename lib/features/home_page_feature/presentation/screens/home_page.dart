import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/tracking_feature/presentation/bloc/tracking_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fire_base.dart';
import '../../../../core/constants/pages.dart';
import '../../../../core/constants/responsive.dart';
import '../../../orders_feature/presentation/bloc/orders_bloc.dart';
import '../bloc/home_page_bloc.dart';
import '../widgets/bottom_navigation_bar_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc homePageBloc;

  @override
  void initState() {
    listenToNotification(BlocProvider.of<OrdersBloc>(context),BlocProvider.of<TrackingBloc>(context));
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsive(context);
    return BlocBuilder<HomePageBloc, HomePageState>(
      buildWhen: (p, c) => p.homeScreenIndex != c.homeScreenIndex,
      builder: (_, state) {
        return Scaffold(
          body: pagesList[state.homeScreenIndex],
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: EdgeInsets.only(top: Res.tinyFont),
              height: Res.font * 2.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationBarItemWidget(
                      homePageBloc: homePageBloc,
                      iconData: Icons.home,
                      index: 0,
                      label: "Home"),
                  BottomNavigationBarItemWidget(
                      homePageBloc: homePageBloc,
                      iconData: Icons.category,
                      index: 1,
                      label: "Categories"),
                  BottomNavigationBarItemWidget(
                      homePageBloc: homePageBloc,
                      iconData: Icons.shopping_cart_outlined,
                      index: 2,
                      label: "cart"),
                  BottomNavigationBarItemWidget(
                      homePageBloc: homePageBloc,
                      iconData: Icons.person_outline_rounded,
                      index: 3,
                      label: "profile"),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
