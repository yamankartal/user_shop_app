import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';


import '../../data/model/category_model.dart';
import '../repository/repository.dart';
import 'categories_use_case.dart';

class SearchCategoriesCase extends CategoriesUseCase<List<CategoryModel>,ParamSearchCategories>{
  final CategoriesRepository repository;
  SearchCategoriesCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(ParamSearchCategories param)async {
    return await repository.searchCategories(param.name);
  }

}



class ParamSearchCategories{
final String name;
  ParamSearchCategories(this.name);
}