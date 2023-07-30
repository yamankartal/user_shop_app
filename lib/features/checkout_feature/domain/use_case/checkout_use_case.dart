import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';

abstract class CheckOutUseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}