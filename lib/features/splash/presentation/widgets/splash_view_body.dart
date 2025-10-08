import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/themes/helpers/spacing.dart';
import 'package:bookly_clean_arch/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_clean_arch/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const OnboardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                effects: [
                  FadeEffect(),
                  ScaleEffect(),
                  RotateEffect(duration: 2.seconds)
                ],
                child: SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  height: 40.h,
                ),
              ),
              horizontalSpace(10),
              Text(
                'Bookly',
                style: AppTextStyles.font32WhiteBold,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0.h,
          child: SvgPicture.asset(
            'assets/svgs/splash_big_logo.svg',
          ),
        )
      ],
    );
  }
}
