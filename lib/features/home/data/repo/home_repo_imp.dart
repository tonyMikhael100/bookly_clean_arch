import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_local_data_source.dart';
// import 'package:bookly_clean_arch/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      //check if there is an cached books
      // var cachedBooks = homeLocalDataSource.fetchNewestBooks();
      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      } else {
        return left(Failure(error: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchTopOfTheWeekBooks() async {
    try {
      // check if there is an cached books
      // var cachedBooks = homeLocalDataSource.fetchTopOfTheWeekBooks();
      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // }
      var books = await homeRemoteDataSource.fetchTopOfTheWeekBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      } else {
        return left(Failure(error: e.toString()));
      }
    }
  }
}
