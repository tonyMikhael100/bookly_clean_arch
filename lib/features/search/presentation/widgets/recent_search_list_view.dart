import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearchListView extends StatelessWidget {
  const RecentSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'The Kite Runner',
                    style: AppTextStyles.font16GrayRegular,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
