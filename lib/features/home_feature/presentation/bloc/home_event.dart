

part of 'home_bloc.dart';
abstract class HomeEvent{}

class GetAllDataEvent extends HomeEvent{}

class ChangePageIndexEvent extends HomeEvent{
  final int index;
  ChangePageIndexEvent(this.index);
}

class SearchProductEvent extends HomeEvent{
  final String  name;
  SearchProductEvent(this.name);
}
