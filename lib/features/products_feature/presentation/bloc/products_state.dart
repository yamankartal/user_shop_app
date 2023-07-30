part of "products_bloc.dart";

class ProductsState {
  final List<ProductModel> products;
  final ProductDetailsModel productDetails;
  final States getProductsState;
  final States getFavoriteProductsState;
  final States getProductDetailsState;
  final States addProductToFavoriteState;
  final States removeProductFromFavoriteState;
  final String errorMsg;
  final States searchProductsState;
  final int productQuantity;

  final int pageViewIndex;

  ProductsState({

    this.productQuantity=0,
    this.productDetails=const ProductDetailsModel(), this.getProductDetailsState=States.init,this.pageViewIndex=0,
  this.products=const[],
      this.getProductsState=States.init,
      this.addProductToFavoriteState=States.init,
      this.removeProductFromFavoriteState=States.init,
      this.errorMsg='',
      this.getFavoriteProductsState=States.init,
      this.searchProductsState=States.init,
}
);
  ProductsState copyWith({
    final int? productQuantity,
    final ProductDetailsModel ?productDetails,
    final States? getProductDetailsState,
    final List<ProductModel>? products,
    final States?  getProductsState,
    final States ? addProductToFavoriteState,
    final States ? removeProductFromFavoriteState,
    final String?  errorMsg,
    final States?  getFavoriteProductsState,
    final States?  searchProductsState,
    final int? pageViewIndex,
  }) {
    return ProductsState(
      getProductDetailsState: getProductDetailsState??this.getProductDetailsState,
     productDetails: productDetails??this.productDetails,
     addProductToFavoriteState: addProductToFavoriteState??this.addProductToFavoriteState,
      getFavoriteProductsState: getFavoriteProductsState??this.getFavoriteProductsState,
      getProductsState: getProductsState??this.getProductsState,
      removeProductFromFavoriteState: removeProductFromFavoriteState??this.removeProductFromFavoriteState,
      searchProductsState: searchProductsState??this.searchProductsState,
      products: products??this.products,
      errorMsg: errorMsg??this.errorMsg,
      pageViewIndex: pageViewIndex??this.pageViewIndex,
      productQuantity: productQuantity??this.productQuantity,
    );
  }
}
