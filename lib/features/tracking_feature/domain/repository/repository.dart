import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/failures.dart';

abstract class TrackingRepository{
  Future<Either<Failure,Position>>getCurrentLocation();
}