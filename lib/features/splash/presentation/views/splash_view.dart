import 'package:bookly_clean_arch/core/themes/color_manager.dart';
import 'package:bookly_clean_arch/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkPrimary,
      body: SplashViewBody(),
    );
  }
}
