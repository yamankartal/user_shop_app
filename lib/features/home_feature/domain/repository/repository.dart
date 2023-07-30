import 'package:dartz/dartz.dart';
import 'package:shopapp/features/home_feature/data/model/home_model.dart';

import '../../../../core/constants/failures.dart';
import '../../../products_feature/data/model/products_model.dart';

abstract class HomeRepository{
  Future<Either<Failure,HomeModel>>getAllData();
  Future<Either<Failure,List<ProductModel>>>searchProducts(String productName);
}