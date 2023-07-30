import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/screens/products_screen.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../products_feature/presentation/bloc/products_bloc.dart';
import '../../../categories_feature/data/model/category_model.dart';

class CategoriesHomeListWidget extends StatelessWidget {
  final List<CategoryModel> ?categories;

  const CategoriesHomeListWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: Res.font*0.7),
      height: Res.height * 0.16,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) =>
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>
                          BlocProvider(create: (_) =>
                              sl<ProductsBloc>(),
                            child: ProductsScreen(
                              categories:categories!,
                              index: index,
                            ),)),);
                  },
                  borderRadius: BorderRadius.circular(
                      Res.padding),
                  child: Column(
                    children: [
                      Container(
                          height: Res.height * 0.12,
                          padding: EdgeInsets.all(
                              Res.padding * 0.6),
                          width: Res.width * 0.22,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColors
                                .withOpacity(0.7),
                            borderRadius: BorderRadius
                                .circular(Res.padding),
                          ),
                          child: Image.network(
                            "$uploadLink/${categories![index].categoryImage
                               }",
                            fit: BoxFit.cover,
                            color: Colors.black54,)
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Res.padding * 0.2),
                        width: Res.width * 0.22,
                        child: Text(categories![index]
                            .categoryName!,
                          style: const TextStyle(
                            color: Colors.black54,),
                          textAlign: TextAlign.center,),
                      ),
                    ],
                  )
              ),

          separatorBuilder: (_, index) =>
              SizedBox(width: Res.padding * 0.5),
          itemCount: categories!
              .length),
    );
  }
}
