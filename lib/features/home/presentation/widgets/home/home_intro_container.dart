import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeIntroContainer extends StatelessWidget {
  const HomeIntroContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: Color(0xffFAF9FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Offers',
                  style: AppTextStyles.font20BlackBold,
                ),
                // verticalSpace(4),
                Text(
                  'Discount 25%',
                  style: AppTextStyles.font14BlackRegular,
                ),
                Spacer(),
                AppButton(
                  text: 'Order Now',
                  onPressed: () {},
                  width: 118.w,
                  height: 36.h,
                  borderRadius: 50,
                )
              ],
            ),
          ),
          Image.asset(
            'assets/images/book.png',
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
