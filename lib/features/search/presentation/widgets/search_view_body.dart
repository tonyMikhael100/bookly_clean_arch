import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/widgets/app_text_field.dart';
import 'package:bookly_clean_arch/features/search/presentation/widgets/recent_search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            hintText: 'Search',
            svgIconPath: 'assets/svgs/Search.svg',
            onChanged: (value) {
              // print(value);
            },
          ),
          verticalSpace(24),
          Text(
            'Recent Searches',
            style: AppTextStyles.font16BlackMeduim,
          ),
          verticalSpace(16),
          // Recent Searches List
          Expanded(
            child: RecentSearchListView(),
          )
        ],
      ),
    );
  }
}
