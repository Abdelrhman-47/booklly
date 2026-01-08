import 'package:booklly/constats.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> cashedFeaturedBooks();
    List<BookEntity> fetchNewestBooks();

}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> cashedFeaturedBooks() {
    return Hive.box<BookEntity>(kFeaturedBox).values.toList();
  }
  
  @override
  List<BookEntity> fetchNewestBooks() {
        return Hive.box<BookEntity>(kNewestBox).values.toList();
  }
}
