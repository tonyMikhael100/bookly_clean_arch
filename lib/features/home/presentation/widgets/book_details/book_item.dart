import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/core/themes/app_text_styles.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          enableDrag: true,
          isScrollControlled: true, // This allows full height
          builder: (context) => BookDetailsView(book: book,),
        );
      },
      child: SizedBox(
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
                    imageUrl: book.bookImageUrl,
                    fit: BoxFit.cover, // cover is usually better than fill
                  ),
                ),
              ),
            ),
            verticalSpace(5),
            Text(
              '  ${book.bookTitle}',
              style: AppTextStyles.font14BlackMeduim,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '   ${book.bookPrice}',
              style: AppTextStyles.font12BlackBold,
            )
          ],
        ),
      ),
    );
  }
}
