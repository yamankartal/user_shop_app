import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class ResetPasswordCase extends AuthUseCase<Unit,ParamResetPassword>{
  final AuthRepository repository;
  ResetPasswordCase(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamResetPassword param)async {
    return  await repository.resetPassword(param.data);
  }
}



class ParamResetPassword{
  final String email;
  final String password;
  ParamResetPassword(this.email, this.password);

  Map<String,dynamic> get data{
    return {
      'email':email,
      'password':password,
    };
  }

}