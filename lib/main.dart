import 'package:bookly_clean_arch/core/di/dependency_injection.dart';
import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/core/routing/app_router.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_top_of_the_week_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/top_of_the_weeks_cubit/top_of_the_week_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_clean_arch/main_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Prevent landscape mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.openBox<BookEntity>('bookBox');
  await Hive.openBox('settings');

  // Initialize dependency injection
  getItSetUp();

  // Run the app AFTER setup
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  TopOfTheWeekBooksCubit(fetchTopOfTheWeekBooksUseCase: getIt())
                    ..fetchTopOfTheWeekBooks()),
          BlocProvider(
              create: (context) =>
                  NewestBooksCubit(getIt())..fetchNewestBooks()),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            // remove splash effect (ripple effect)
            splashFactory: NoSplash.splashFactory,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
