import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';

abstract class ProductsRepository{
  Future<Either<Failure,List<ProductModel>>>getProducts(int categoryId);
  Future<Either<Failure,ProductDetailsModel>>getProductDetails(int productId);
  Future<Either<Failure,List<ProductModel>>>getFavoriteProducts();
  Future<Either<Failure,Unit>>addProductToFavorite(int productId);
  Future<Either<Failure,Unit>>removeProductFromFavorite(int productId);
  Future<Either<Failure,List<ProductModel>>>searchProducts(String productName);
}