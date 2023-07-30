part of 'categories_bloc.dart';

class CategoriesState {
  final States getCategoriesState;
  final States searchCategoriesState;
  final List<CategoryModel> categories;
  final List<CategoryModel> searchedCategories;

  CategoriesState(
      {this.getCategoriesState = States.init,
      this.searchCategoriesState = States.init,
      this.categories = const [],
      this.searchedCategories = const []});

  CategoriesState copyWith({

    final States? getCategoriesState,
    final States?  searchCategoriesState,
    final List<CategoryModel>?  categories,
    final List<CategoryModel>?  searchedCategories,


}){

    return CategoriesState(
      categories: categories??this.categories,
      searchedCategories: searchedCategories??this.searchedCategories,
      getCategoriesState: getCategoriesState??this.getCategoriesState,
      searchCategoriesState: searchCategoriesState??this.searchCategoriesState
    );

  }

}
