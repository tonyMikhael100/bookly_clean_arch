import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/themes/color_manager.dart';
import 'package:bookly_clean_arch/core/widgets/app_button.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/onboarding/presentation/widgets/custom_on_boarding_page.dart';
import 'package:bookly_clean_arch/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              bottom: 150.h, top: 65.h, left: 30.w, right: 30.w),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomOnBoardigPage(
                      imageUrl: 'assets/images/onbarding_1.png',
                      title: 'Now reading books will be easier',
                      subTitle:
                          ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
                    ),
                    CustomOnBoardigPage(
                      imageUrl: 'assets/images/onboarding_2.png',
                      title: 'Your Bookish Soulmate Awaits',
                      subTitle:
                          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
                    ),
                    CustomOnBoardigPage(
                      imageUrl: 'assets/images/onboarding_3.png',
                      title: 'Start Your Adventure',
                      subTitle:
                          'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
                    ),
                  ],
                ),
              ),
              verticalSpace(40),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 10.h, // height of each dot
                  dotWidth: 10.w, // width of each dot
                  spacing: 5.w, // space between dots
                  radius: 8, // corner radius
                  dotColor: Colors.grey.shade400, // inactive dot color
                  activeDotColor: ColorManager.darkPrimary, // active dot color
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 120.h,
        alignment: Alignment.center,
        child: AppButton(
          onPressed: () async {
            if (pageController.page == 2) {
              context.pushReplacement('/mainScaffold');
              var settingsBox = Hive.box('settings');
              settingsBox.put('onBoardingDone', true);
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          text: 'Get Started',
        ),
      ),
    );
  }
}
