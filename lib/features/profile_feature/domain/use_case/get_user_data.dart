
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/auth_feature/data/model/user_model.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/profile_use_case.dart';

import '../repository/repository.dart';

class GetUserDataCase extends ProfileUseCase<UserModel,ParamGetUserData>{
  final ProfileRepository repository;
  GetUserDataCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(ParamGetUserData param)async{
    return  await repository.getUserData();
  }
}


class ParamGetUserData{

}