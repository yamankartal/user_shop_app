import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/features/categories_feature/data/model/category_model.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/responsive.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItemWidget({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Res.padding)
      ),
      child:Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Res.padding)
        ),
        elevation: Res.padding*0.5,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Res.padding),
                    topRight: Radius.circular(Res.padding)
                ),
                child: Container(
                  padding: EdgeInsets.all(Res.padding*0.5),
                  //color:AppColor.primaryColor.withOpacity(0.2),
                  width: Res.width*0.45,
                  height: Res.height*0.18,
                  child:Image.network("$uploadLink/${categoryModel.categoryImage!}",),
                )
            ),

            ClipRRect(
              borderRadius:BorderRadius.only(
                  bottomRight: Radius.circular(Res.padding),
                  bottomLeft: Radius.circular(Res.padding)
              ) ,
              child:   Container(
                //color: AppColor.primaryColor.withOpacity(0.1),
                alignment: Alignment.center,
                width: Res.width*0.43,
                height: Res.font*1.6,
                child: Text(categoryModel.categoryName!,style: TextStyle(
                    color: AppColor.primaryColors,
                    fontSize: Res.font,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
