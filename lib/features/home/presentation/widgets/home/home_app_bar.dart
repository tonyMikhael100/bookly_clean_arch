import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.push('/searchView');
            },
            child: SvgPicture.asset(
              'assets/svgs/Search.svg',
              width: 22.w,
              height: 22.h,
            ),
          ),
          Text(
            'Home',
            style: AppTextStyles.font20BlackBold,
          ),
          SvgPicture.asset('assets/svgs/Notification.svg',
              width: 22.w, height: 22.h),
        ],
      ),
    );
  }
}
