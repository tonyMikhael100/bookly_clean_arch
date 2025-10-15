part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksFailureState extends NewestBooksState {
  final String erroMessage;

  NewestBooksFailureState({required this.erroMessage});
}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> booksList;

  NewestBooksSuccessState({required this.booksList});
}
