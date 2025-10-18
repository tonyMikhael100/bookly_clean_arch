import 'package:bookly_clean_arch/core/services/shared_pref_service.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_clean_arch/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  @override
  void initState() {
    super.initState();

// to wait flutter for building the ui first then you can navigate , its important line
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool? onBoardingDone =
          SharedPrefsService().getValue<bool>('onBoardingDone');
      if (onBoardingDone == true) {
        Future.delayed(const Duration(seconds: 3), () {
          context.pushReplacement('/mainScaffold');
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          context.pushReplacement('/onboardingView');
        });
      }
    });
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
                'Sphere',
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
