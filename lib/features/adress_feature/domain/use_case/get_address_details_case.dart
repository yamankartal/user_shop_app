

import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../../data/model/address_details_model.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class GetAddressDetailsCase extends AddressesUseCase<AddressDetailsModel,ParamGetAddressDetails>{

  final AddressRepository repository;
  GetAddressDetailsCase(this.repository);
  @override
  Future<Either<Failure,AddressDetailsModel>> call(ParamGetAddressDetails param)async{
    return await repository.getAddressDetails(param.addressId);
  }

}




class ParamGetAddressDetails{
  final int addressId;
  ParamGetAddressDetails(this.addressId);
}