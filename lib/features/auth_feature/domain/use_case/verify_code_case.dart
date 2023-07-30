import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class CaseVerifyCode extends AuthUseCase<Unit,ParamVerifyCode>{
  final AuthRepository repository;
  CaseVerifyCode(this.repository);
  @override
  Future<Either<Failure, Unit>> call(ParamVerifyCode param)async{
    return await repository.verifyCode(param.data);
  }
}



class ParamVerifyCode{
  final int verifyCode;
  final String email;
  ParamVerifyCode(this.verifyCode, this.email);

  Map<String,dynamic> get data{
    return {
      'email':email,
      'verify_code':verifyCode.toString(),
    };
  }

}