import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../../data/model/shop_address_model.dart';
import '../repository/repository.dart';
import 'addresses_use_case.dart';

class GetShopAddressCase extends AddressesUseCase<ShopAddressModel, ParamGetShopAddress> {
  final AddressRepository repository;

  GetShopAddressCase(this.repository);

  @override
  Future<Either<Failure, ShopAddressModel>> call(ParamGetShopAddress param) async {
    return await repository.getShopAddress();
  }
}

class ParamGetShopAddress {


  ParamGetShopAddress();
}
