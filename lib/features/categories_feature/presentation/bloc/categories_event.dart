part of 'categories_bloc.dart';

abstract class CategoriesEvent{}

class GetCategoriesEvent extends CategoriesEvent{}
class SearchCategoriesEvent extends CategoriesEvent{
  final String categoryName;
  SearchCategoriesEvent(this.categoryName);
}
class InitSearchEvent extends CategoriesEvent{

}