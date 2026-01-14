import 'package:booklly/constats.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/utiles/api_service.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: 'volumes?&q=computer science&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    var box = Hive.box<BookEntity>(kFeaturedBox);
    if (pageNumber == 0) {
      await box.clear();
    }
    await box.addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest',
    );
    List<BookEntity> books = getBooksList(data);
    await Hive.box<BookEntity>(kNewestBox).addAll(books);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=$category',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
