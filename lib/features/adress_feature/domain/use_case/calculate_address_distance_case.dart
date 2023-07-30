import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../../data/model/addressModel.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class CalculateAddressDistanceCase extends AddressesUseCase<double, ParamCalculateAddressDistance> {
  final AddressRepository repository;

  CalculateAddressDistanceCase(this.repository);

  @override
  Future<Either<Failure, double>> call(ParamCalculateAddressDistance param) async {
    return await repository.calculateAddressDistance(param.lat, param.long, param.shopLat, param.shopLong);
  }
}

class ParamCalculateAddressDistance {
  final double lat;
  final double long;
  final double shopLat;
  final double shopLong;
  ParamCalculateAddressDistance(this.lat, this.long, this.shopLat, this.shopLong);



}
