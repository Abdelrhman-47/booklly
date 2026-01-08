import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> cashedFeaturedBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> cashedFeaturedBooks() {
    return Hive.box<BookEntity>("book_entity").values.toList();
  }
}
