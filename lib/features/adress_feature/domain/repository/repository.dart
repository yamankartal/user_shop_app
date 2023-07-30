import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/addressModel.dart';
import '../../data/model/address_details_model.dart';
import '../../data/model/shop_address_model.dart';

abstract class AddressRepository{
  Future<Either<Failure,List<AddressModel>>>getAddresses();
  Future<Either<Failure,AddressDetailsModel>>getAddressDetails(int addressId);
  Future<Either<Failure,AddressModel>>addAddress(Map<String,dynamic>data);
  Future<Either<Failure,bool>>deleteAddresses(int id);
  Future<Either<Failure,bool>>updateAddresses(Map<String,dynamic>data,int addressId);
  Future<Either<Failure,Position>>getPosition();
  Future<Either<Failure,double>>calculateAddressDistance(final double lat,final double long,final double shopLat,final double shopLong);
  Future<Either<Failure,ShopAddressModel>>getShopAddress();

}