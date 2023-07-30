import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopapp/core/constants/exceptions.dart';
import 'package:shopapp/features/adress_feature/data/model/addressModel.dart';
import 'package:shopapp/features/adress_feature/data/model/address_details_model.dart';
import 'package:shopapp/features/adress_feature/data/model/shop_address_model.dart';
import 'package:shopapp/features/adress_feature/domain/repository/repository.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';

import '../../../../core/constants/failures.dart';
import '../sources/remote.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
class AddressRepositoryImp extends AddressRepository{
  final AddressRemote remote;
  final AuthLocal local;
  final InternetConnectionChecker internetConnectionChecker;
  AddressRepositoryImp(this.remote, this.local, this.internetConnectionChecker);

  @override
  Future<Either<Failure,AddressModel>> addAddress(Map<String, dynamic> data)async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res=await remote.addAddress(data, local.getId());
        if(res!=null){
          return Right(res);
        }
        return Left(BackendFailure(""));

      }
      on ServerException{
        return Left(ServerFailure());
      }
    }

    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAddresses(int id)async {
    if(await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.deleteAddresses(id);
        if (res) {
          return Right(res);
        }
        return Left(BackendFailure(""));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses()async {
    if(await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.getAddresses(local.getId());
        if (res.isEmpty) {
          return Left(BackendFailure(""));
        }
        return Right(res);
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateAddresses(Map<String,dynamic>data,int addressId) async{

    if(await internetConnectionChecker.hasConnection) {
      try {
        final res = await remote.updateAddresses(data, addressId);
        return Right(res);
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else{
    return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure,Position>> getPosition()async {
    if(await internetConnectionChecker.hasConnection) {
    try{
      return Right(await remote.getPosition());
    }on ServerException{
      return Left(ServerFailure());
    }
  }
  else{
  return Left(ConnectionFailure());
  }
  }

  @override
  Future<Either<Failure,AddressDetailsModel>> getAddressDetails(int addressId) async{
    if(await internetConnectionChecker.hasConnection) {
    try{
      final res=await remote.getAddressDetails(addressId);
      if(res==null){
        return Left(BackendFailure(""));
      }
      return Right(res);
    }on ServerException{
      return Left(ServerFailure());
    }
    }
    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, double>> calculateAddressDistance(double lat, double long, double shopLat, double shopLong) async{
    if(await internetConnectionChecker.hasConnection) {
      try{
        final res=await remote.calculateAddressDistance(lat, long, shopLat, shopLong);
        if(res==null){
          return Left(BackendFailure(""));
        }
        return Right(res);
      }on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ShopAddressModel>> getShopAddress()async {
    if(await internetConnectionChecker.hasConnection) {
      try{
        final res=await remote.getShopAddress();
        if(res==null){
          return Left(BackendFailure(""));
        }
        return Right(res);
      }on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ConnectionFailure());
    }
  }
}