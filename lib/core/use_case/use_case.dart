import 'package:booklly/core/erreors/failur.dart';
import 'package:dartz/dartz.dart';

abstract class USeCase<Type,Param>{
  Future <Either<Failur,Type>>  call([Param param]);
}
