import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/book_details/book_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return BookItem(
              book: BookEntity(
                  bookId: '',
                  bookImageUrl: 'https://picsum.photos/200/300',
                  bookTitle: 'dummy',
                  bookSubTitle: 'dummy',
                  bookPrice: 'dummy',
                  bookUrl: 'dummy'),
            );
          },
        ),
      ),
    );
  }
}
