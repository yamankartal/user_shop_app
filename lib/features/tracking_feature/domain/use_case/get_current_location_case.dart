import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopapp/core/constants/failures.dart';
import 'package:shopapp/features/tracking_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class GetCurrentLocationCase extends TrackingUseCase<Position,ParamGetCurrentLocation>{

  final TrackingRepository repository;
  GetCurrentLocationCase(this.repository);
  @override
  Future<Either<Failure, Position>> call(ParamGetCurrentLocation param)async{
    return await repository.getCurrentLocation();
  }
}



class ParamGetCurrentLocation{

}