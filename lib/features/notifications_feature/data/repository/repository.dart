import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';


import 'package:shopapp/features/notifications_feature/data/model/notifications_model.dart';

import '../../../../core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import '../sources/remote.dart';

class NotificationsRepositoryImp extends NotificationsRepository{
 final NotificationsRemote remote;
 final  AuthLocal local;
  NotificationsRepositoryImp(this.remote, this.local);

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications()async{
    try{
      final res=await remote.getNotifications(local.getId()!);
      if(res.isEmpty){
        return Left(BackendFailure(""));
      }
      return Right(res);
    }
        on ServerException{
      return Left(ServerFailure());
        }
  }

}