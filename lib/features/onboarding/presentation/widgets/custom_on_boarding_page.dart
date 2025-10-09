import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOnBoardigPage extends StatelessWidget {
  const CustomOnBoardigPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl),
        verticalSpace(8),
        Text(
          title,
          style: AppTextStyles.font24BlackBold,
          textAlign: TextAlign.center,
        ),
        verticalSpace(16),
        Expanded(
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16GrayRegular,
          ),
        ),
      ],
    );
  }
}
