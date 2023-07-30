import 'package:bloc/bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/notifications_model.dart';
import '../../domain/use_case/get_notifications_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent,NotificationsState> {
  final GetNotificationsCase getNotificationsCase;

  NotificationsBloc(this.getNotificationsCase) : super(NotificationsState()) {
    on<GetNotificationsEvent>((event, emit) async {
      emit(state.copyWith(getNotificationsState: States.loading));
      final res = await getNotificationsCase.call(ParamGetNotifications());
      res.fold(
        (l) => emit(state.copyWith(getNotificationsState: States.error)),
        (r) => emit(
          state.copyWith(
            getNotificationsState: States.loaded,
            notifications: List.of(r),
          ),
        ),
      );
    });
  }
}
