import 'package:dartz/dartz.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';

class IsSignInCase extends AuthUseCase<bool,ParamIsSignIn>{
  final AuthRepository repository;
  IsSignInCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(ParamIsSignIn param) {
    return repository.isSignIn();
  }
}



class ParamIsSignIn{


  ParamIsSignIn();




}