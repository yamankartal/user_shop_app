import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/widgets.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../categories_feature/data/model/category_model.dart';
import '../bloc/products_bloc.dart';
import '../widgets/product_category_widget.dart';
import '../widgets/product_item_widget.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List<CategoryModel> categories;
  final int index;

  const ProductsScreen(
      {Key? key, required this.categories, required this.index})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsBloc productsBloc;
  late int pageViewIndex;
  late List<CategoryModel> categories;
  late PageController pageController;

  @override
  void initState() {
    categories = widget.categories;
    pageViewIndex = widget.index;
    pageController = PageController(initialPage: pageViewIndex);
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(GetProductsEvent(categories[pageViewIndex].categoryId!));
    productsBloc.add(ChangePageViewIndexEvent(pageViewIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Res.padding),
        padding: EdgeInsets.symmetric(horizontal: Res.padding),
        width: Res.width,
        height: Res.fullHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ProductCategoryWidget(
                    categories: categories,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Res.padding),
                    height: Res.height * 0.9,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        productsBloc.add(
                          ChangePageViewIndexEvent(index),
                        );
                        productsBloc.add(
                          GetProductsEvent(categories[index].categoryId!),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        categories.length,
                        (index) => SizedBox(
                          child: BlocBuilder<ProductsBloc, ProductsState>(
                            buildWhen: (p, c) =>
                                p.getProductsState != c.getProductsState,
                            builder: (_, state) {
                              if (state.getProductsState == States.loading) {
                                return circularProgressIndicatorWidget();
                              } else if (state.getProductsState ==
                                  States.loaded) {
                                return BlocBuilder<ProductsBloc, ProductsState>(
                                  buildWhen: (p, c) =>
                                      p.addProductToFavoriteState !=
                                          c.addProductToFavoriteState ||
                                      p.removeProductFromFavoriteState !=
                                          c.removeProductFromFavoriteState,
                                  builder: (_, state) {
                                    return RefreshIndicator(
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: Res.padding * 0.5,
                                          crossAxisSpacing: Res.padding * 0.5,
                                          mainAxisExtent: Res.height * 0.32,
                                        ),
                                        itemCount: state.products.length,
                                        itemBuilder: (_, index) => InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider.value(
                                                      value: productsBloc,
                                                    ),
                                                    BlocProvider(
                                                        create: (_) =>
                                                            sl<CartBloc>()),
                                                  ],
                                                  child: ProductDetailsScreen(
                                                    index: index,
                                                    productId: state
                                                        .products[index]
                                                        .productId!,
                                                    fromScreen:
                                                        FromScreen.products,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: ProductItemWidget(
                                            index: index,
                                            productModel: state.products[index],
                                            productsBloc: productsBloc,
                                          ),
                                        ),
                                      ),
                                      onRefresh: () async {
                                        productsBloc.add(GetProductsEvent(
                                            categories[index].categoryId!));
                                      },
                                    );
                                  },
                                );
                              } else if (state.getProductsState ==
                                  States.error) {
                                return const Center(
                                  child: Text(
                                    'Empty',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }

                              return Container();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
