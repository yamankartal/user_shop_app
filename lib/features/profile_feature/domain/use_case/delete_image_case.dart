
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/profile_use_case.dart';

import '../repository/repository.dart';

class DeleteImageCase extends ProfileUseCase<Unit,ParamDeleteImage>{
  final ProfileRepository repository;
  DeleteImageCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamDeleteImage param)async{
    return  await repository.deleteImage();
  }
}


class ParamDeleteImage{


}