import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

import '../../data/model/check_out_model.dart';
import '../repository/repository.dart';
import 'checkout_use_case.dart';

class CheckOutOrderCase extends CheckOutUseCase<CheckOutModel,ParamCheckOutOrder>{

  final CheckOutRepository repository;
  CheckOutOrderCase(this.repository);
  @override
  Future<Either<Failure, CheckOutModel>> call(ParamCheckOutOrder param) async{
    return await repository.checkOutOrder(param.data);
  }
}


class ParamCheckOutOrder{

  final int addressId;
  ParamCheckOutOrder( this.addressId);
  Map<String,dynamic>get data{
    return {
      "address_id":addressId.toString()
    };
  }
}