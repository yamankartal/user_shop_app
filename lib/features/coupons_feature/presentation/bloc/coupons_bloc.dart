import 'package:bloc/bloc.dart';

import '../../../../core/constants/enums.dart';

import '../../data/model/coupon_model.dart';
import '../../domain/use_case/get_coupons_case.dart';

part 'coupons_event.dart';

part 'coupons_state.dart';

class CouponsBloc extends Bloc<CouponsEvent, CouponsState> {
  final GetCouponsCase getCouponsCase;

  CouponsBloc(this.getCouponsCase) : super(CouponsState()) {
    on<GetCouponsEvent>((event, emit) async {
      emit(state.copyWith(getCouponsState: States.loading));
      final res = await getCouponsCase.call(ParamGetCoupons());
      res.fold((l) => emit(state.copyWith(getCouponsState: States.error)),
          (r) => emit(state.copyWith(getCouponsState: States.loaded,coupons: List.of(r))));
    });
  }
}
