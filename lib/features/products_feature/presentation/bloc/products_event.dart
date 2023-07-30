part of "products_bloc.dart";

abstract class ProductsEvent{}

class GetProductsEvent extends ProductsEvent{
  final int categoryId;
  GetProductsEvent(this.categoryId);
}

class AddProductToCartEvent extends ProductsEvent{}

class RemoveProductFromCartEvent extends ProductsEvent{}

class AddProductToFavoriteEvent extends ProductsEvent{
  final int index;
  AddProductToFavoriteEvent(this.index);
}

class RemoveProductFromFavoriteEvent extends ProductsEvent{
  final int index;
  RemoveProductFromFavoriteEvent(this.index);

}

class GetFavoriteProductsEvent extends ProductsEvent{}

class SearchProductsEvent extends ProductsEvent{
  final String productName;
  SearchProductsEvent(this.productName);
}


class ChangePageViewIndexEvent extends ProductsEvent{
  final int index;
  ChangePageViewIndexEvent(this.index);
}

class InitSearchingProductEvent extends ProductsEvent{


}


class GetProductDetailsEvent extends ProductsEvent{

  final int productId;

  GetProductDetailsEvent(this.productId);

}

class IncreaseProductQuantityEvent extends ProductsEvent{

}

class DecreaseProductQuantityEvent  extends ProductsEvent {}


class SetQuantityProductEvent extends ProductsEvent{
  final int productQuantity;
  SetQuantityProductEvent(this.productQuantity);
}





