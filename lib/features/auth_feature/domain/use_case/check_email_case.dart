import 'package:dartz/dartz.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';

class CheckEmailCase extends AuthUseCase<Unit,ParamCheckEmail>{
  final AuthRepository repository;
  CheckEmailCase(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamCheckEmail param) {
    return repository.checkEmail(param.email);
  }
}



class ParamCheckEmail{
  final String email;

  ParamCheckEmail(this.email);




}