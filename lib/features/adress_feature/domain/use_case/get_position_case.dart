

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class GetPositionCase extends AddressesUseCase<Position,ParamGetPosition>{

  final AddressRepository repository;
  GetPositionCase(this.repository);
  @override
  Future<Either<Failure, Position>> call(ParamGetPosition param)async{
    return await repository.getPosition();
  }

}




class ParamGetPosition{

}