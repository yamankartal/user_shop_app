import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/cart_model.dart';

abstract class CartRepository{
  Future<Either<Failure,Unit>>addProductToCart(final int productId,Map<String,dynamic>data);
  Future<Either<Failure,Unit>>removeProductFromCart( final int cartId);
  Future<Either<Failure,Unit>>decreaseProductQuantityFromCart(final int productId);
  Future<Either<Failure,Unit>>updateCart(final int cartId,Map<String,dynamic>data);
  Future<Either<Failure,List<CartModel>>>getCart();
}