import 'package:bookly_clean_arch/core/themes/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle font32WhiteBold = TextStyle(
    fontSize: 32.sp,
    color: Color(0xffffffff),
    fontWeight: FontWeight.bold,
  );

  // font24Bold 121212
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font16GrayRegular = TextStyle(
    fontSize: 16.sp,
    color: Color(0xffA6A6A6),
    fontWeight: FontWeight.w400,
  );
  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font14BlackMeduim = TextStyle(
    fontSize: 14.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font12BlackBold = TextStyle(
    fontSize: 12.sp,
    color: ColorManager.darkPrimary,
    fontWeight: FontWeight.bold,
  );
}
