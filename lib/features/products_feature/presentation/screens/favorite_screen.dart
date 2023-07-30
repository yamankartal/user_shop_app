import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/widgets.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/products_bloc.dart';
import '../widgets/product_item_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late ProductsBloc productsBloc;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(GetFavoriteProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text("Favorites",style: TextStyle(color: AppColor.primaryColors,fontSize: Res.font*1.3,fontWeight: FontWeight.bold,height: Res.tinyFont),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Res.font),
        padding: EdgeInsets.symmetric(horizontal: Res.padding * 0.5),
        width: Res.width,
        height: Res.fullHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (_, state) {
                  if (state.getFavoriteProductsState == States.loading) {
                    return circularProgressIndicatorWidget();
                  } else if (state.getFavoriteProductsState == States.loaded) {
                    return RefreshIndicator(
                      child: SizedBox(
                        height: Res.height * 0.93,
                        width: Res.width,
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
                                  builder: (_) => BlocProvider.value(
                                    value: productsBloc,
                                    child: const Scaffold(),
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
                      ),
                      onRefresh: () async {
                        productsBloc.add(GetFavoriteProductsEvent());
                      },
                    );
                  } else if (state.getFavoriteProductsState == States.error) {
                    return errorWidget(state.errorMsg);
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
