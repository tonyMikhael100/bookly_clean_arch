import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final String error;
  final String total;
  final List<BookItem> books;

  BookModel({
    required this.error,
    required this.total,
    required this.books,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

@JsonSerializable()
class BookItem extends BookEntity {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  BookItem({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  }) : super(
            bookId: isbn13,
            bookImageUrl: image,
            bookTitle: title,
            bookSubTitle: subtitle,
            bookPrice: price,
            bookUrl: url);

  factory BookItem.fromJson(Map<String, dynamic> json) =>
      _$BookItemFromJson(json);

  Map<String, dynamic> toJson() => _$BookItemToJson(this);
}
