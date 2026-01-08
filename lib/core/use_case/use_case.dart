import 'package:booklly/core/erreors/failur.dart';
import 'package:dartz/dartz.dart';

abstract class USeCase<Type,Param>{
  Future <Either<Failure,Type>>  call([Param param]);
}
