import 'package:flutter/material.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/responsive.dart';

class HomeSearchWidget extends StatelessWidget {
  final ProductsBloc productsBloc;
  final TextEditingController search;

  const HomeSearchWidget(
      {Key? key, required this.productsBloc, required this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Res.width * 0.74,
      margin: EdgeInsets.symmetric(horizontal: Res.padding * 0.5),
      child: TextFormField(
        controller: search,
        onChanged: (val) {
          if (val.isEmpty) {
            productsBloc.add(InitSearchingProductEvent());
          }
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              if (search.text.isNotEmpty) {
                productsBloc.add(SearchProductsEvent(search.text));
              }
            },
            icon: Icon(
              Icons.search,
              size: Res.font * 0.8,
              color: Colors.black,
            ),
          ),
          hintText: "Find product",
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Res.padding * 0.5),
          ),
        ),
      ),
    );
  }
}
