class BookEntity {
  final String bookId;
  final String bookImageUrl;
  final String bookTitle;
  final String bookSubTitle;
  final String bookPrice;
  final String bookUrl;

  BookEntity(
      {required this.bookId,
      required this.bookImageUrl,
      required this.bookTitle,
      required this.bookSubTitle,
      required this.bookPrice,
      required this.bookUrl});
}
