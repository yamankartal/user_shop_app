import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';


import '../../data/model/category_model.dart';
import '../repository/repository.dart';
import 'categories_use_case.dart';

class GetCategoriesCase extends CategoriesUseCase<List<CategoryModel>,ParamGetCategories>{
  final CategoriesRepository repository;
  GetCategoriesCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(ParamGetCategories param)async {
    return await repository.getCategories();
  }

}



class ParamGetCategories{

}