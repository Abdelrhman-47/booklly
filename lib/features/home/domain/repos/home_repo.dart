import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/erreors/failur.dart';

abstract class HomeRepo{
  Future<Either<Failur,List<BookEntity>>> featchFeatuerdBooks();
  Future<Either<Failur,List<BookEntity>>>featchNewestdBooks();
}