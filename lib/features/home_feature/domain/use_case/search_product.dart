import 'package:dartz/dartz.dart';
import 'package:shopapp/features/home_feature/domain/use_case/home_use_case.dart';

import '../../../../core/constants/failures.dart';
import '../../../products_feature/data/model/products_model.dart';
import '../repository/repository.dart';

class SearchItemsCase extends HomeUseCase<List<ProductModel>,ParamSearchProducrts>{
  final HomeRepository repository;
  SearchItemsCase(this.repository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(ParamSearchProducrts param)async{
    return await repository.searchProducts(param.productName);
  }
}


class ParamSearchProducrts{
  final String productName;
  ParamSearchProducrts(this.productName);
}