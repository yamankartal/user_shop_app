import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/responsive.dart';
import '../../../categories_feature/data/model/category_model.dart';
import '../bloc/products_bloc.dart';

class ProductCategoryWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const ProductCategoryWidget({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (_, state) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: Res.font * 0.7),
          height: Res.font * 1.6,
          child: Text(
            "${categories[state.pageViewIndex].categoryName}",
            style: TextStyle(fontSize: Res.font, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
