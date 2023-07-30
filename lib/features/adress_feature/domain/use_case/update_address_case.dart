import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class UpdateAddressesCase extends AddressesUseCase<bool, ParamUpdateAddresses> {
  final AddressRepository repository;

  UpdateAddressesCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamUpdateAddresses param) async {
    return await repository.updateAddresses(param.data,param.addressId);
  }
}

class ParamUpdateAddresses {
  final int addressId;
  final String addressCity;
  final String addressStreet;
  final String addressDetails;
  final String addressFloor;
  final int addressPhone;
  ParamUpdateAddresses( this.addressCity, this.addressStreet, this.addressDetails, this.addressFloor, this.addressId, this.addressPhone);

  Map<String,dynamic>get data{
    return {
      "address_city":addressCity,
      "address_street":addressStreet,
      "address_details":addressDetails,
      "address_floor":addressFloor,
      "address_phone":addressPhone.toString()
    };
  }

}
