import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_clean_arch/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooklyApp());

  //prevent landscape mode
  //prevent ipad from rotating too (only portrait mode)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainScaffold(),
      ),
    );
  }
}
