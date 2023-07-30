import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/category_model.dart';

abstract class CategoriesRepository{
  Future<Either<Failure,List<CategoryModel>>>getCategories();
  Future<Either<Failure,List<CategoryModel>>>searchCategories(String categoryName);
}