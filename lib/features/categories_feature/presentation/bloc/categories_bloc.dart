import 'package:bloc/bloc.dart';


import '../../../../core/constants/enums.dart';
import '../../data/model/category_model.dart';
import '../../domain/use_case/get_categoies_case.dart';
import '../../domain/use_case/search_categories_case.dart';

part 'categories_event.dart';
part 'categories_state.dart';


class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState>{

  final GetCategoriesCase getCategoriesCase;
  final SearchCategoriesCase searchCategoriesCase;

  CategoriesBloc(this.getCategoriesCase, this.searchCategoriesCase) : super(CategoriesState()){

    on<GetCategoriesEvent>((event, emit) async{
      emit(state.copyWith(getCategoriesState: States.loading));
      final res=await getCategoriesCase.call(ParamGetCategories());
      res.fold((l) => emit(state.copyWith(getCategoriesState: States.error)), (r) => emit(state.copyWith(getCategoriesState: States.loaded,categories: List.of(r))));

    });
    on<SearchCategoriesEvent>((event, emit) async{
      emit(state.copyWith(searchCategoriesState: States.loading));
      final res=await searchCategoriesCase.call(ParamSearchCategories(event.categoryName));
      res.fold((l) => emit(state.copyWith(searchCategoriesState: States.error)), (r) => emit(state.copyWith(searchCategoriesState: States.loaded,searchedCategories: List.of(r))));
    });


    on<InitSearchEvent>((event, emit){
      emit(state.copyWith(searchCategoriesState: States.init));
    });


  }

}