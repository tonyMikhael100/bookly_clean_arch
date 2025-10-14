import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String bookImageUrl;
  @HiveField(2)
  final String bookTitle;
  @HiveField(3)
  final String bookSubTitle;
  @HiveField(4)
  final String bookPrice;
  @HiveField(5)
  final String bookUrl;

  BookEntity(
      {required this.bookId,
      required this.bookImageUrl,
      required this.bookTitle,
      required this.bookSubTitle,
      required this.bookPrice,
      required this.bookUrl});
}
