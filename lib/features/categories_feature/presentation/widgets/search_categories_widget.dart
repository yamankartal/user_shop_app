import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';
import '../bloc/categories_bloc.dart';

class SearchCategoriesWidget extends StatelessWidget {
  final CategoriesBloc categoriesBloc;
  final TextEditingController search;

  const SearchCategoriesWidget({Key? key, required this.categoriesBloc, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Res.width*0.74,
      margin: EdgeInsets.symmetric(horizontal: Res.padding*0.5),
      child: TextFormField(
        controller: search,
        onChanged: (val) {
          if (val.isEmpty) {
            categoriesBloc.add(InitSearchEvent());
          }
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                if (search.text.isNotEmpty) {
                  categoriesBloc.add(SearchCategoriesEvent(search.text));
                }
              },
              icon: Icon(
                Icons.search, size: Res.font * 0.8,
                color: Colors.black,),
            ),
            hintText: "Find product",
            hintStyle: const TextStyle(
                color: Colors.black),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    Res.padding * 0.5)
            )
        ),
      ),
    );
  }
}
