import 'package:bookly_clean_arch/core/networking/api_constants.dart';
import 'package:bookly_clean_arch/features/home/data/models/book_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.topOfTheWeekBooks)
  Future<BookModel> fetchTopOfTheWeekBooks();

  @GET(ApiConstants.newestBooks)
  Future<BookModel> fetchNewestBooks();

  @GET("${ApiConstants.searchBook}/{query}")
  Future<BookModel> fetchSearchedBooks(@Path('query') String query);
}
