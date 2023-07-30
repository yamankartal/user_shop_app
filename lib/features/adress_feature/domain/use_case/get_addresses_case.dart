

import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

import '../../data/model/addressModel.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class GetAddressesCase extends AddressesUseCase<List<AddressModel>,ParamGetAddresses>{

  final AddressRepository repository;
  GetAddressesCase(this.repository);
  @override
  Future<Either<Failure, List<AddressModel>>> call(ParamGetAddresses param)async{
    return await repository.getAddresses();
  }

}




class ParamGetAddresses{

}