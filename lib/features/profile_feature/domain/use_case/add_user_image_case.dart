
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/profile_use_case.dart';

import '../repository/repository.dart';

class AddUserImageCase extends ProfileUseCase<String,ParamAddUserImage>{
  final ProfileRepository repository;
  AddUserImageCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ParamAddUserImage param)async{
    return  await repository.addImage(param.data);
  }
}


class ParamAddUserImage{
  final String image;
  ParamAddUserImage(this.image);


  Map<String,dynamic>get data{
    return {
      "image":image
    };
  }

}