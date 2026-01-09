import 'package:booklly/constats.dart';
import 'package:booklly/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class HiveInit{
    static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter((BookEntityAdapter()));
  
   

    if (!Hive.isBoxOpen(kFeaturedBox)) {
      await Hive.openBox<BookEntity>(kFeaturedBox);
    }
    if (!Hive.isBoxOpen(kNewestBox)) {
      await Hive.openBox<BookEntity>(kNewestBox);
    }
   

  }
}