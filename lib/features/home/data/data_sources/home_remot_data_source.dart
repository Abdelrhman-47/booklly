import '../../../../core/utiles/api_service.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint:
      'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science',
    );
    List<BookEntity> books = getBooksList(data);
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

  /// =======================
  /// 📌 Helper Method
  /// =======================
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
