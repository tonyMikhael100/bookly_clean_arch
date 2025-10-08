import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/themes/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double borderRadius;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorManager.darkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        minimumSize: Size(width ?? 315.w, height ?? 56.h),
      ),
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.font16WhiteBold,
      ),
    );
  }
}
