import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/constants/enums.dart';
import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';
import '../../domain/use_case/add_product_to_favorite_case.dart';
import '../../domain/use_case/get_favorite_produts.dart';
import '../../domain/use_case/get_product_details_case.dart';
import '../../domain/use_case/get_products_case.dart';
import '../../domain/use_case/remove_product_from_favorite.dart';
import '../../domain/use_case/search_product.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsCase getProductsCase;
  final GetProductDetailsCase getProductDetailsCase;

  final GetFavoriteProductsCase getFavoriteProductsCase;
  final SearchProductsCase searchItemsCase;
  final AddProductToFavoriteCase addToFavoriteCase;
  final RemoveFromFavoriteCase removeFromFavoriteCase;

  ProductsBloc(
      this.addToFavoriteCase,
      this.removeFromFavoriteCase,
      this.searchItemsCase,

      this.getProductsCase, this.getFavoriteProductsCase, this.getProductDetailsCase)
      : super(ProductsState()) {


    on<GetProductsEvent>((event, emit) async {
        emit(state.copyWith(getProductsState: States.loading));
        final res =
            await getProductsCase.call(ParamGetProducts(event.categoryId));
        res.fold(
          (l) => emit(state.copyWith(
            getProductsState: States.error,
          )),
          (r) => emit(
            state.copyWith(
              getProductsState: States.loaded,
              products: List.of(r),
            ),
          ),
        );
      },);

    on<AddProductToFavoriteEvent>((event, emit) async {
      emit(state.copyWith(addProductToFavoriteState: States.loading));
      state.products[event.index] = state.products[event.index].copyWith(isFavoriteProduct: true);
      emit(state.copyWith(addProductToFavoriteState: States.loaded, products: List.of(state.products)));
      final res = await addToFavoriteCase.call(ParamAddProductToFavorite(state.products[event.index].productId!));
      res.fold((l) {
        state.products[event.index] = state.products[event.index].copyWith(isFavoriteProduct: false);
        emit(state.copyWith(addProductToFavoriteState: States.error));
      }, (r) {
        emit(state.copyWith(addProductToFavoriteState: States.loaded));
      });
    });

    on<RemoveProductFromFavoriteEvent>((event, emit) async {
      emit(state.copyWith(removeProductFromFavoriteState: States.loading));
      state.products[event.index] =
          state.products[event.index].copyWith(isFavoriteProduct: false);
      emit(state.copyWith(removeProductFromFavoriteState: States.loaded));
      final res = await removeFromFavoriteCase
          .call(ParamRemoveFromFavorite(state.products[event.index].productId!));
      res.fold((l) {
        state.products[event.index] =
            state.products[event.index].copyWith(isFavoriteProduct: true);
        emit(state.copyWith(removeProductFromFavoriteState: States.error));
      }, (r) => emit(state.copyWith(removeProductFromFavoriteState: States.loaded),),);
    });

    on<GetFavoriteProductsEvent>((event, emit) async {
      emit(state.copyWith(getFavoriteProductsState: States.loading));
      final res = await getFavoriteProductsCase.call(ParamGetFavoriteProducts());
      res.fold(
          (l) => emit(state.copyWith(getFavoriteProductsState: States.error)),
          (r) => emit(state.copyWith(
              getFavoriteProductsState: States.loaded, products: List.of(r),),),);
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(state.copyWith(searchProductsState: States.loading));
      final res = await searchItemsCase.call(ParamSearchProducts(event.productName));
      res.fold(
          (l) => emit(state.copyWith(searchProductsState: States.error)),
          (r) => emit(state.copyWith(
              searchProductsState: States.loaded, products: List.of(r))));
    });





    on<ChangePageViewIndexEvent>((event, emit) {
      emit(state.copyWith(pageViewIndex: event.index));
    });



    on<InitSearchingProductEvent>((event, emit)async {
      emit(state.copyWith(searchProductsState:  States.init));
    });


    on<GetProductDetailsEvent>((event, emit)async{
      emit(state.copyWith(getProductDetailsState: States.loading));
      final res=await getProductDetailsCase.call(ParamGetProductDetails(event.productId));
      res.fold((l) => emit(state.copyWith(getProductDetailsState: States.error)), (r)
      {
        print("yes");
        emit(state.copyWith(getProductDetailsState: States.loaded,productDetails: r));
      });
    });

    on<IncreaseProductQuantityEvent>((event, emit){
      if(state.productQuantity<state.productDetails.productQuantity!) {
        emit(state.copyWith(productQuantity: state.productQuantity+1));
      }
    });

    on<DecreaseProductQuantityEvent>((event, emit){
      if(state.productQuantity>1) {
        emit(state.copyWith(productQuantity: state.productQuantity-1));
      }
    });

    on<SetQuantityProductEvent>((event, emit){
        emit(state.copyWith(productQuantity:event.productQuantity));
    });



  }



}
