import 'package:booklly/core/erreors/failur.dart';
import 'package:booklly/core/use_case/use_case.dart';
import 'package:booklly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends USeCase<List<BookEntity>, void>{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failur,List<BookEntity>>> call([void param]) {
    return homeRepo.fetchNewestBooks();
  }

}