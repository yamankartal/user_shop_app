import 'package:dartz/dartz.dart';
import 'package:shopapp/core/constants/failures.dart';

abstract class TrackingUseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}