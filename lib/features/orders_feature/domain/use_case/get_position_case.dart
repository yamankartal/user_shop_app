

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/constants/failures.dart';
import 'package:shopapp/features/orders_feature/domain/use_case/orders_use_case.dart';

import '../repository/repository.dart';

class GetCurPositionCase extends OrdersUseCase<Position,ParamGetPosition>{

  final OrdersRepository repository;
  GetCurPositionCase(this.repository);
  @override
  Future<Either<Failure, Position>> call(ParamGetPosition param)async{
    return await repository.getPosition();
  }

}




class ParamGetPosition{

}