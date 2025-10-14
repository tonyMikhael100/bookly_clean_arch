import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/core/routing/app_router.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_clean_arch/main_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const BooklyApp());
//initialize hive
  await Hive.initFlutter();
  //register adapter of book entity
  Hive.registerAdapter(BookEntityAdapter());
  //open a box
  await Hive.openBox('bookBox');
  //prevent landscape mode
  //prevent ipad from rotating too (only portrait mode)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //test apis
  // ApiService(Dio()).fetchSearchedBooks('flutter').then((value) {
  //   debugPrint(value.books[0].title);
  // });

  HomeRemoteDataSourceImpl(apiService: ApiService(Dio())).fetchNewestBooks();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
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
    );
  }
}
