import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchTopOfTheWeekBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await apiService.fetchNewestBooks();
    List<BookEntity> books = [];
    for (int i = 0; i < response.books.length; i++) {
      //becaues the bookModel is BookEntity so we can add it directly
      books.add(response.books[i]);
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchTopOfTheWeekBooks() async {
    var response = await apiService.fetchTopOfTheWeekBooks();
    List<BookEntity> books = [];
    for (int i = 0; i < response.books.length; i++) {
      //becaues the bookModel is BookEntity so we can add it directly
      books.add(response.books[i]);
    }
    return books;
  }
}
