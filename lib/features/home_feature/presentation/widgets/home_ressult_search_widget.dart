import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../products_feature/data/model/products_model.dart';
import '../../../products_feature/presentation/screens/product_details_screen.dart';
import '../../../products_feature/presentation/widgets/product_item_widget.dart';

class HomeResultSearchWidget extends StatelessWidget {
  final List<ProductModel> products;
  final ProductsBloc productsBloc;

  const HomeResultSearchWidget(
      {Key? key, required this.products, required this.productsBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Res.height*0.9,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: Res.padding,horizontal: Res.padding*0.8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Res.padding * 0.5,
          crossAxisSpacing: Res.padding * 0.5,
          mainAxisExtent: Res.height * 0.32,
        ),
        itemCount: products.length,
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(value: productsBloc),
                  BlocProvider(create:(_)=>sl<CartBloc>()),
                ], child:  ProductDetailsScreen(
                    productId: products[index].productId!,
                    index: index,
                )),
              ),
            );
          },
          child: ProductItemWidget(
            index: index,
            productModel: products[index],
            productsBloc: productsBloc,
          ),
        ),
      ),
    );
  }
}
