import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.penguinrandomhouse.com/cover/9780525529156',
                  fit: BoxFit.cover, // cover is usually better than fill
                ),
              ),
            ),
          ),
          verticalSpace(5),
          Text(
            '  The Kite Runner',
            style: AppTextStyles.font14BlackMeduim,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '   \$14.99',
            style: AppTextStyles.font12BlackBold,
          )
        ],
      ),
    );
  }
}
