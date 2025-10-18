import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_top_of_the_week_books_use_case.dart';
import 'package:meta/meta.dart';

part 'top_of_the_week_books_state.dart';

class TopOfTheWeekBooksCubit extends Cubit<TopOfTheWeekBooksState> {
  TopOfTheWeekBooksCubit({required this.fetchTopOfTheWeekBooksUseCase})
      : super(TopOfTheWeekBooksInitial());
  final FetchTopOfTheWeekBooksUseCase fetchTopOfTheWeekBooksUseCase;

  void fetchTopOfTheWeekBooks() async {
    emit(TopOfTheWeekBooksLoadingState());
    var result = await fetchTopOfTheWeekBooksUseCase.call();
    result.fold((failure) {
      emit(TopOfTheWeekBooksFailureState(erroMessage: failure.error));
    }, (books) {
      
      emit(TopOfTheWeekBooksSuccessState(booksList: books));
    });
  }
}
