import 'package:dartz/dartz.dart';
import 'package:shopapp/features/home_feature/data/model/home_model.dart';
import 'package:shopapp/features/home_feature/domain/repository/repository.dart';
import 'package:shopapp/features/home_feature/domain/use_case/home_use_case.dart';

import '../../../../core/constants/failures.dart';


class GetAllDataCase extends HomeUseCase<HomeModel,GetAllDataParam>{
 final HomeRepository repository;

  GetAllDataCase(this.repository);

  @override
  Future<Either<Failure, HomeModel>> call(GetAllDataParam param)async{
    return await repository.getAllData();
  }
}


class GetAllDataParam{}