import 'package:bookly_clean_arch/core/networking/api_constants.dart';
import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/core/networking/dio_factory.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repo/home_repo_imp.dart';
import 'package:bookly_clean_arch/features/home/domain/repo/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_home_books_use_cases.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetUp() {
  // Dio instance
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<Dio>(dio);

  // API Service
  getIt.registerSingleton<ApiService>(
    ApiService(dio, baseUrl: ApiConstants.baseUrl),
  );

  // Data Sources
  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImpl(),
  );

  // Repository
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImp(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  // Use Case
  getIt.registerFactory<FetchNewestBooksUseCase>(
    () => FetchNewestBooksUseCase(getIt<HomeRepo>()),
  );

  // Cubit
  getIt.registerFactory<NewestBooksCubit>(
    () => NewestBooksCubit(getIt<FetchNewestBooksUseCase>()),
  );
}
