import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/core/themes/color_manager.dart';
import 'package:bookly_clean_arch/core/widgets/app_button.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/book_details/bottom_sheet_close_item.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/book_details/star_row_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetCloseIcon(),
              verticalSpace(8),
              // Book Image
              Center(
                child: Container(
                  height: 313.h,
                  width: 237.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey,
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.penguinrandomhouse.com/cover/9780525529156',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              verticalSpace(24),
              // Title and heart icon
              Row(
                children: [
                  Text(
                    'The Kite Runner',
                    style: AppTextStyles.font20BlackBold,
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svgs/heart_fill.svg',
                      height: 24.h, width: 24.w),
                ],
              ),
              verticalSpace(16),
              // Description
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font14GreyRegular,
              ),
              verticalSpace(16),
              Text(
                'Reviews',
                style: AppTextStyles.font20BlackBold,
              ),
              verticalSpace(16),
              StarRowBuilder(),
              verticalSpace(24),
              Row(
                children: [
                  Container(
                    width: 106.w,
                    height: 40.h,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(
                              Icons.remove,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                          ),
                        ),
                        Text(
                          '1',
                          style: AppTextStyles.font16BlackMeduim,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: ColorManager.darkPrimary,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(16),
                  Text('\$14.99', style: AppTextStyles.font16BlackMeduim),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Continue shopping',
                      onPressed: () {},
                      borderRadius: 50,
                    ),
                  ),
                  horizontalSpace(8),
                  AppButton(
                    width: 115,
                    text: 'View cart',
                    backgroundColor: Colors.white,
                    textColor: ColorManager.darkPrimary,
                    onPressed: () {},
                    borderRadius: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
