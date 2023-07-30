import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../products_feature/presentation/bloc/products_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/OfferProductsListWidget.dart';
import '../widgets/categories_home_list_widget.dart';
import '../widgets/coupon_text_widget.dart';
import '../widgets/coupons_list_widget.dart';
import '../widgets/home_favorite_icon_widget.dart';
import '../widgets/home_ressult_search_widget.dart';
import '../widgets/home_search_widget.dart';
import '../widgets/offet_text_widget.dart';
import '../widgets/top_selling_products_list__widget.dart';
import '../widgets/top_selling_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  late ProductsBloc productsBloc;
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    homeBloc.add(GetAllDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          top: Res.height * 0.08,
        ),
        padding: EdgeInsets.symmetric(horizontal: Res.padding*0.5),
        child: BlocBuilder<HomeBloc, HomeState>(

          buildWhen: (p,c)=>p.getHomeDataState!=c.getHomeDataState,



          builder: (_, state) {
            if (state.getHomeDataState == States.loading) {
              return circularProgressIndicatorWidget();
            } else if (state.getHomeDataState == States.loaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        HomeSearchWidget(
                          productsBloc: productsBloc,
                          search: search,
                        ),
                        const FavoriteIconWidget(),
                      ],
                    ),
                    BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (_, pState) {
                        if (pState.searchProductsState == States.init ||
                            pState.searchProductsState == States.error) {
                          return Column(
                            children: [
                              const CouponTextWidget(),
                              CouponsListWidget(
                                homeModel: state.homeModel,
                              ),
                              CategoriesHomeListWidget(
                                  categories: state.homeModel.categories),
                              const TopSellingTextWidget(),
                              TopSellingProductsListWidget(
                                  topSelling:
                                      state.homeModel.topSellingProducts ?? []),
                              const OfferTextWidget(),
                              OfferProductsListWidget(
                                  offers: state.homeModel.offerProducts!),
                            ],
                          );
                        } else if (pState.searchProductsState ==
                            States.loading) {
                          return circularProgressIndicatorWidget();
                        }

                        return HomeResultSearchWidget(
                          products: pState.products,
                          productsBloc: productsBloc,
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state.getHomeDataState == States.error) {
              return const Center(
                child: Text("error"),
              );
            }

            return Container();
          },
        ),
    );
  }
}
