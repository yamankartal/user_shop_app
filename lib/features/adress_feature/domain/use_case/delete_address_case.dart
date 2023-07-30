import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../repository/repository.dart';
import 'addresses_use_case.dart';

class DeleteAddressesCase extends AddressesUseCase<bool, ParamDeleteAddresses> {
  final AddressRepository repository;

  DeleteAddressesCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamDeleteAddresses param) async {
    return await repository.deleteAddresses(param.id);
  }
}

class ParamDeleteAddresses {

 final  int id;
  ParamDeleteAddresses(this.id);

}
