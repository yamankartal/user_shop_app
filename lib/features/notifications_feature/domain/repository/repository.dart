import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/notifications_model.dart';

abstract class NotificationsRepository{
  Future<Either<Failure,List<NotificationModel>>>getNotifications();
}