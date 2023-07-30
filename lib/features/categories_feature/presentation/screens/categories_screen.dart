import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/colors.dart';
import 'package:shopapp/features/products_feature/presentation/screens/products_screen.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../home_feature/presentation/widgets/home_favorite_icon_widget.dart';
import '../../../products_feature/presentation/bloc/products_bloc.dart';
import '../../data/model/category_model.dart';
import '../bloc/categories_bloc.dart';
import '../widgets/categories_text_widget.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/search_categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesBloc categoriesBloc;
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text("Categories",style: TextStyle(color: AppColor.primaryColors,fontSize: Res.font*1.3,fontWeight: FontWeight.bold,height: Res.tinyFont),),
      ),
      body: SizedBox(
        width: Res.width,
        height: Res.fullHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<CategoriesBloc, CategoriesState>(
                buildWhen: (p, c) =>
                    p.getCategoriesState != c.getCategoriesState,
                builder: (_, state) {
                  if (state.getCategoriesState == States.loading) {
                    return circularProgressIndicatorWidget();
                  } else if (state.getCategoriesState == States.loaded) {
                    return BlocConsumer<CategoriesBloc, CategoriesState>(
                      listener: (_, state) {
                        if (state.searchCategoriesState == States.error) {
                          showSnackBar(context, 'error searching');
                        }
                      },
                      buildWhen: (p, c) =>
                          p.searchCategoriesState != c.searchCategoriesState,
                      builder: (_, state) {
                        if (state.searchCategoriesState == States.loading) {
                          return circularProgressIndicatorWidget();
                        }
                        final List<CategoryModel> categories =
                            state.searchCategoriesState == States.loaded
                                ? state.searchedCategories
                                : state.categories;
                        return SizedBox(
                          height: Res.height ,
                          child: RefreshIndicator(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  vertical: Res.padding,
                                  horizontal: Res.padding),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: Res.font,
                                crossAxisSpacing: Res.padding,
                                mainAxisExtent: Res.height * 0.245,
                              ),
                              itemCount: categories.length,
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                        create: (_) => sl<ProductsBloc>(),
                                        child: ProductsScreen(
                                          categories: categories,
                                          index: index,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: CategoryItemWidget(
                                  categoryModel: state.categories[index],
                                ),
                              ),
                            ),
                            onRefresh: () async {
                              categoriesBloc.add(GetCategoriesEvent());
                              categoriesBloc.add(InitSearchEvent());
                            },
                          ),
                        );
                      },
                    );
                  } else if (state.getCategoriesState == States.error) {
                    return const Center(
                      child: Text('error'),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
