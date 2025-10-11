import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TopOfWeekRow extends StatelessWidget {
  const TopOfWeekRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Top of the week',
          style: AppTextStyles.font18BlackBold,
        ),
        const Spacer(),
        Text('see all', style: AppTextStyles.font14BlackRegular),
      ],
    );
  }
}
