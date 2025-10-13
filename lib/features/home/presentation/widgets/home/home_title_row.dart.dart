import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeTitleRow extends StatelessWidget {
  const HomeTitleRow({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.font18BlackBold,
        ),
        const Spacer(),
        GestureDetector(
            onTap: onTap,
            child: Text('see all', style: AppTextStyles.font14BlackRegular)),
      ],
    );
  }
}
