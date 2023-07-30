import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../../data/model/addressModel.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class AddAddressesCase extends AddressesUseCase<AddressModel, ParamAddAddresses> {
  final AddressRepository repository;

  AddAddressesCase(this.repository);

  @override
  Future<Either<Failure, AddressModel>> call(ParamAddAddresses param) async {
    return await repository.addAddress(param.data);
  }
}

class ParamAddAddresses {
  final double addressLat;
  final double addressLong;
  final String addressCity;
  final String addressStreet;
  final String addressDetails;
  final String addressFloor;
  final int addressPhone;
  final double addressDistance;

  ParamAddAddresses({
    required this.addressDistance,
    required this.addressPhone,
    required this.addressLat,
    required this.addressLong,
    required this.addressCity,
    required this.addressStreet,
    required this.addressDetails,
    required this.addressFloor,
  });

  Map<String, dynamic> get data => {
        "address_lat": addressLat.toString(),
        "address_long": addressLong.toString(),
        "address_city": addressCity.toString(),
        "address_street": addressStreet.toString(),
        "address_details": addressDetails.toString(),
        "address_floor": addressFloor.toString(),
        "address_phone": addressPhone.toString(),
        "address_distance": addressDistance.toString(),
      };
}
