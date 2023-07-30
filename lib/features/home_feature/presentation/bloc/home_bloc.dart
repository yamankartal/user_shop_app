import 'package:bloc/bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/home_model.dart';
import '../../domain/use_case/get_all_data_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {



  final GetAllDataCase getAllDataCase;

  HomeBloc(this.getAllDataCase, ) : super(HomeState()) {

    on<GetAllDataEvent>((event, emit) async {
      emit(state.copyWith(getHomeDataState: States.loading));
      final res = await getAllDataCase.call(GetAllDataParam());
       res.fold((l) => emit(state.copyWith(getHomeDataState: States.error)), (r) => emit(state.copyWith(getHomeDataState: States.loaded,homeModel: r)));
    });

    on<ChangePageIndexEvent>((event, emit) {
      emit(state.copyWith(pageIndex: event.index));
    });








  }
}
