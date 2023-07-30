part of 'cart_bloc.dart';

class CartState {
  final States addToCartState;
  final States removeFromCartState;
  final States updateCartState;
  final States getCartState;
  final States discountFromCartState;
  final List<CartModel> cart;
  final String errorMsg;

  CartState({
    this.errorMsg="",
      this.addToCartState = States.init,
      this.removeFromCartState = States.init,
      this.updateCartState = States.init,
      this.getCartState = States.init,
      this.discountFromCartState = States.init,
      this.cart = const []});

  CartState copyWith(

  {
    final States ?addToCartState,
    final States? removeFromCartState,
    final States? updateCartState,
    final States? getCartState,
    final States? discountFromCartState,
    final List<CartModel> ?cart,
    final String ?errorMsg,


}


      ){
    return CartState(

      addToCartState: addToCartState??this.addToCartState,
      discountFromCartState: discountFromCartState??this.discountFromCartState,
      getCartState: getCartState??this.getCartState,
      removeFromCartState: removeFromCartState??this.removeFromCartState,
      updateCartState: updateCartState??this.updateCartState,
      cart: cart??this.cart,
      errorMsg: errorMsg??this.errorMsg,
    );
  }


}
