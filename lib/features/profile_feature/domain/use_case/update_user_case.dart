
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/profile_use_case.dart';

import '../repository/repository.dart';

class UpdateUserNameCase extends ProfileUseCase<Unit,ParamUpdateUserName>{
  final ProfileRepository repository;
  UpdateUserNameCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamUpdateUserName param)async{
    return await repository.updateUserName(param.userName);
  }
}


class ParamUpdateUserName{
  final String userName;
  ParamUpdateUserName(this.userName);
}