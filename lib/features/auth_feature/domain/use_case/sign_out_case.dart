import 'package:dartz/dartz.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';

class SignOutCase extends AuthUseCase<Unit,ParamSignOut>{
  final AuthRepository repository;
  SignOutCase(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamSignOut param) {
    return Future.value(repository.signOut());
  }
}



class ParamSignOut{


  ParamSignOut();




}