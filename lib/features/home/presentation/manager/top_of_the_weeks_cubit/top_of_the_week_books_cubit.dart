import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'top_of_the_week_books_state.dart';

class TopOfTheWeekBooksCubit extends Cubit<TopOfTheWeekBooksState> {
  TopOfTheWeekBooksCubit() : super(TopOfTheWeekBooksInitial());
}
