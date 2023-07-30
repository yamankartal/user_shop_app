
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/profile_use_case.dart';

import '../repository/repository.dart';

class UpdateUserImageCase extends ProfileUseCase<String,ParamAUpdateUserImage>{
  final ProfileRepository repository;
  UpdateUserImageCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ParamAUpdateUserImage param)async{
    return  await repository.addImage(param.data);
  }
}


class ParamAUpdateUserImage{
  final String image;
  final String oldImage;
  ParamAUpdateUserImage(this.image, this.oldImage);


  Map<String,dynamic>get data{
    return {
      "image":image,
      "old_image":oldImage
    };
  }

}