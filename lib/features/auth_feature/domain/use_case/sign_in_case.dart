import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class CaseSignIn extends AuthUseCase<Unit,ParamSignIn>{
  final AuthRepository repository;
  CaseSignIn(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamSignIn param) {
    return repository.signIn(param.data);
  }
}



class ParamSignIn{
  final String email;
  final String password;
  ParamSignIn(this.email, this.password);


  Map<String,dynamic> get data{
    return {
      'email':email,
      'password':password,
    };
  }

}