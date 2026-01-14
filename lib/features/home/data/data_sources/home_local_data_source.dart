import 'package:booklly/constats.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> cashedFeaturedBooks([int pageNumber = 0]);
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> cashedFeaturedBooks([int pageNumber = 0]) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int totalCount = box.length;

    if (startIndex >= totalCount) {
      return [];
    }

    if (endIndex > totalCount) {
      endIndex = totalCount;
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return Hive.box<BookEntity>(kNewestBox).values.toList();
  }
}
