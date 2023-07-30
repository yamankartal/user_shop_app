import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/use_case.dart';

import '../../data/model/user_model.dart';
import '../repository/repository.dart';

class CaseSignUp extends AuthUseCase<UserModel,ParamSignUp>{
  final AuthRepository repository;
  CaseSignUp(this.repository);
  @override
  Future<Either<Failure, UserModel>> call(ParamSignUp param) {
    return repository.signUp(param.data);
  }
}



class ParamSignUp{
  final String email;
  final String password;
  final String phone;
  final String userName;
  ParamSignUp(this.email, this.password, this.phone, this.userName);

  Map<String,dynamic>get data{
    return {
      'email':email,
      'password':password,
      'phone':phone,
      'userName':userName,
    };

  }

}