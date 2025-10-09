import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/svgs/Search.svg'),
          Text(
            'Home',
            style: AppTextStyles.font20BlackBold,
          ),
          SvgPicture.asset('assets/svgs/Notification.svg')
        ],
      ),
    );
  }
}
