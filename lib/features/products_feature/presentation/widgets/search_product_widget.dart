import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/responsive.dart';


class SearchProductsWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const SearchProductsWidget({Key? key, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: Res.width*0.75,
      child: TextFormField(
        controller: textEditingController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon:  Icon(Icons.search,size: Res.font*0.8,color: Colors.black,),
            hintText: "Find product",
            hintStyle: const TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(Res.padding*0.5)
            )
        ),
      ),
    );
  }
}
