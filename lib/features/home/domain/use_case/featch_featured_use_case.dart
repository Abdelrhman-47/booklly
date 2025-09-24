import 'package:booklly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/erreors/failur.dart';
import '../entities/book_entity.dart';
abstract class USeCase<type>{
  Future <Either<Failur,type>>  call();
}
class FeatchFeaturedBooksUseeCase extends USeCase<List<BookEntity>>{
  final HomeRepo homeRepo;

  FeatchFeaturedBooksUseeCase(this.homeRepo);
  @override
  Future<Either<Failur,List<BookEntity>>> call(){
    return homeRepo.featchFeatuerdBooks();
  }

}