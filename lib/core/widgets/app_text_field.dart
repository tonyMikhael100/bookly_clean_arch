import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? svgIconPath;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.svgIconPath,
    this.keyboardType,
    this.obscureText = false,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 12,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //  when i click anywhere unfocus textfield
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        filled: true,
        fillColor: fillColor ?? Colors.grey.shade100,
        prefixIcon: svgIconPath != null
            ? SvgPicture.asset(
                svgIconPath!,
                width: 22.w,
                height: 22.h,
                fit: BoxFit.scaleDown,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
      ),
    );
  }
}
