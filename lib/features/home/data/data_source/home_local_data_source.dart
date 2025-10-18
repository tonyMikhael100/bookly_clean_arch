import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>('bookBox');
    return box.values.toList();
  }
  List<BookEntity> fetchTopOfTheWeekBooks() {
    var box = Hive.box<BookEntity>('bookBox');
    return box.values.toList();
  }
}
