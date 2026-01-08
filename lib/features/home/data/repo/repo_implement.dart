import 'package:booklly/core/erreors/failur.dart';
import 'package:booklly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklly/features/home/data/data_sources/home_remot_data_source.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:booklly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class RepoImplement extends HomeRepo {
  RepoImplement({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  HomeLocalDataSource homeLocalDataSource;
  HomeRemoteDataSource homeRemoteDataSource;
  @override
  Future<Either<Failur, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      final cachedBooks = await homeLocalDataSource.cashedFeaturedBooks();

      if (cachedBooks.isEmpty) {
        final remoteBooks = await homeRemoteDataSource.fetchFeaturedBooks();
        return right(remoteBooks);
      }
      return right(cachedBooks);
    } catch (e) {
      return left(Failur());
    }
  }

  @override
  Future<Either<Failur, List<BookEntity>>> fetchNewestBooks() async {
    try {
      final cachedBooks = await homeLocalDataSource.fetchNewestBooks();

      if (cachedBooks.isEmpty) {
        final cachedBooks = await homeRemoteDataSource.fetchNewestBooks();
        return right(cachedBooks);
      }
      return right(cachedBooks);
    } catch (e) {
      return left(Failur());
    }
  }
}
