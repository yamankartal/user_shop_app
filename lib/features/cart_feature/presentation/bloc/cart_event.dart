part of 'cart_bloc.dart';

abstract class CartEvent{}

class GetCartEvent extends CartEvent{


}

class AddToCartEvent extends CartEvent{
  final int productId;
  final int productQuantity;
  final double productPrice;

  AddToCartEvent(this.productId, this.productQuantity, this.productPrice);
}

class UpdateCartEvent extends CartEvent{
 final int index;
 final int productQuantity;
  UpdateCartEvent(this.index, this.productQuantity);
}


class RemoveFromCartEvent extends CartEvent{
  final int index;
  RemoveFromCartEvent( this.index);
}


class DiscountFromCartEvent extends CartEvent{
  final int index;
  DiscountFromCartEvent(this.index);
}








