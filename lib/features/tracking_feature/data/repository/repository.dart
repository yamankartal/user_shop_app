import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopapp/core/constants/failures.dart';
import '../../domain/repository/repository.dart';
import '../sources/remote.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class TrackingRepositoryImp extends TrackingRepository{

  final TrackingRemote remote;
  final InternetConnectionChecker internetConnectionChecker;
  TrackingRepositoryImp(this.remote, this.internetConnectionChecker);

  @override
  Future<Either<Failure, Position>> getCurrentLocation()async{
    if(await internetConnectionChecker.hasConnection){
      final res = await remote.getCurrentLocation();
      return Right(res);
    }
    else{
      return Left(ConnectionFailure());
    }
  }



}