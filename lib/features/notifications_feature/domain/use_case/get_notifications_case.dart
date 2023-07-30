
import 'package:dartz/dartz.dart';
import 'package:shopapp/features/notifications_feature/domain/use_case/use_case.dart';
import 'package:shopapp/features/notifications_feature/domain/repository/repository.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/notifications_model.dart';

class GetNotificationsCase extends NotificationsUseCase<List<NotificationModel>,ParamGetNotifications>{
  final NotificationsRepository repository;
  GetNotificationsCase(this.repository);

  @override
  Future<Either<Failure, List<NotificationModel>>> call(ParamGetNotifications paramGetNotifications)async{
    return await repository.getNotifications();
  }

}


class ParamGetNotifications{}