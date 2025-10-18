import 'package:bookly_clean_arch/core/networking/api_constants.dart';
import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/core/networking/dio_factory.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repo/home_repo_imp.dart';
import 'package:bookly_clean_arch/features/home/domain/repo/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_home_books_use_cases.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_top_of_the_week_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/top_of_the_weeks_cubit/top_of_the_week_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

final getIt = GetIt.instance;

void getItSetUp() {
  // Dio instance
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // API Service
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<Dio>(), baseUrl: ApiConstants.baseUrl),
  );

  // Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImp(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<FetchNewestBooksUseCase>(
    () => FetchNewestBooksUseCase(getIt<HomeRepo>()),
  );

  getIt.registerLazySingleton<FetchTopOfTheWeekBooksUseCase>(
    () => FetchTopOfTheWeekBooksUseCase(getIt<HomeRepo>()),
  );

  // Cubits (factories are better for Cubits, so each screen gets a new instance)
  getIt.registerFactory<NewestBooksCubit>(
    () => NewestBooksCubit(getIt<FetchNewestBooksUseCase>()),
  );

  getIt.registerFactory<TopOfTheWeekBooksCubit>(
    () => TopOfTheWeekBooksCubit(
      fetchTopOfTheWeekBooksUseCase: getIt<FetchTopOfTheWeekBooksUseCase>(),
    ),
  );
}
