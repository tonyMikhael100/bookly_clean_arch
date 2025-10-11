import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRowBuilder extends StatelessWidget {
  const StarRowBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          return Icon(Icons.star, color: Colors.amber, size: 24.sp);
        }),
        horizontalSpace(8),
        Text(
          '( 5 )',
          style: AppTextStyles.font14BlackMeduim,
        )
      ],
    );
  }
}
