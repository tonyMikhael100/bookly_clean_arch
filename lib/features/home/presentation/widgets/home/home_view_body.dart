import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_intro_container.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_top_of_the_week_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/top_of_week_row.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Skeletonizer(
          enabled: false,
          child: Column(
            children: [
              verticalSpace(24),
              HomeIntroContainer(),
              verticalSpace(24),
              // Top of week Section
              TopOfWeekRow(),
              verticalSpace(16),
              // List top of weeks books
              const HomeTopOfTheWeekListView(),
              verticalSpace(24),
              // Top of week Section
              TopOfWeekRow(),
              verticalSpace(16),
              // List top of weeks books
              const HomeTopOfTheWeekListView(),
            ],
          ),
        ),
      ),
    );
  }
}
