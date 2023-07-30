import 'package:bloc/bloc.dart';
import 'package:shopapp/core/constants/constants.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/add_to_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/get_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/remove_from_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/update_cart_case.dart';

import '../../../../core/constants/enums.dart';

import '../../data/model/cart_model.dart';
import '../../domain/use_case/discount_from_cart_case.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartCase addToCartCase;
  final RemoveFromCartCase removeFromCartCase;
  final UpdateCartCase updateCartCase;
  final GetCartCase getCartCase;
  final DiscountFromCartCase discountFromCartCase;

  CartBloc(this.addToCartCase, this.removeFromCartCase, this.updateCartCase,
      this.getCartCase, this.discountFromCartCase)
      : super(CartState()) {

    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(getCartState: States.loading));
      final res = await getCartCase.call(ParamGetCart());
      res.fold(
          (l) => emit(state.copyWith(getCartState: States.error)),
          (r) => emit(
              state.copyWith(getCartState: States.loaded, cart: List.of(r))));
    });

    on<AddToCartEvent>((event, emit) async {
      emit(state.copyWith(addToCartState: States.loading));
      final res = await addToCartCase.call(ParamAddCarts(event.productId, event.productQuantity,event.productPrice));
      res.fold(
              (l) => emit(state.copyWith(addToCartState: States.error)),
              (r) => emit(
              state.copyWith(addToCartState: States.loaded)));
      emit(state.copyWith(addToCartState: States.init));
    });

    on<RemoveFromCartEvent>((event, emit) async {
      print('tt');
      emit(state.copyWith(removeFromCartState: States.loading));
      final res = await removeFromCartCase.call(ParamRemoveFromCart(state.cart[event.index].cartId!));
      res.fold((l) => emit(state.copyWith(removeFromCartState: States.error,errorMsg:"error")), (r) =>
          emit(state.copyWith(removeFromCartState: States.loaded,cart: List.of(state.cart)..removeAt(event.index))));
    });

    on<DiscountFromCartEvent>((event, emit) async {
      emit(state.copyWith(discountFromCartState: States.loading));
      final res = await discountFromCartCase.call(ParamDiscountItemFromCart(state.cart[event.index].productId!));
      res.fold(
              (l) => emit(state.copyWith(discountFromCartState: States.error)),
              (r) => emit(
              state.copyWith(discountFromCartState: States.loaded)));
    });

    on<UpdateCartEvent>((event, emit)async{
      emit(state.copyWith(updateCartState: States.loading));
      final res=await updateCartCase.call(ParamUpdateCart(state.cart[event.index].cartId!,event.productQuantity));
      res.fold((l) {
        emit(state.copyWith(updateCartState: States.error,));
        print("no");
      }, (r) {
        state.cart[event.index]=state.cart[event.index].copyWith(cartProductQuantity:event.productQuantity,);
        emit(state.copyWith(updateCartState: States.loaded,cart: List.of(state.cart)));
        emit(state.copyWith(updateCartState: States.init));
      });
    });

  }
}
