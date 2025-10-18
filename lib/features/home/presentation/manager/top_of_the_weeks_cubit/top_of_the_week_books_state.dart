part of 'top_of_the_week_books_cubit.dart';

@immutable
sealed class TopOfTheWeekBooksState {}

final class TopOfTheWeekBooksInitial extends TopOfTheWeekBooksState {}

final class TopOfTheWeekBooksLoadingState extends TopOfTheWeekBooksState {}

final class TopOfTheWeekBooksFailureState extends TopOfTheWeekBooksState {
  final String erroMessage;

  TopOfTheWeekBooksFailureState({required this.erroMessage});
}

final class TopOfTheWeekBooksSuccessState extends TopOfTheWeekBooksState {
  final List<BookEntity> booksList;

  TopOfTheWeekBooksSuccessState({required this.booksList});
}
