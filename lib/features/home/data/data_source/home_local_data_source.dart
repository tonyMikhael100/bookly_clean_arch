import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  // not future because we are getting data from local db (hive)
  List<BookEntity> fetchTopOfTheWeekBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>('bookBox');
    List<BookEntity> books = [];
    books = box.values.toList();
    return books;
  }

  @override
  List<BookEntity> fetchTopOfTheWeekBooks() {
    var box = Hive.box<BookEntity>('bookBox');
    List<BookEntity> books = [];
    books = box.values.toList();
    return books;
  }
}
