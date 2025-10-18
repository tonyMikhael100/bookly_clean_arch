import 'package:bookly_clean_arch/core/helpers/spacing.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/top_of_the_weeks_cubit/top_of_the_week_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_intro_container.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_books_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_title_row.dart.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(24),
            HomeIntroContainer(),
            verticalSpace(24),
            // Top of week Section
            HomeTitleRow(
              title: 'Newest Books',
              onTap: () {},
            ),
            verticalSpace(16),
            // List of newestt books
            BlocBuilder<NewestBooksCubit, NewestBooksState>(
              builder: (context, state) {
                if (state is NewestBooksLoadingState) {
                  return LoadingList();
                } else if (state is NewestBooksFailureState) {
                  return Center(
                    child: Text(
                      'there is an erro : ${state.erroMessage} ',
                    ),
                  );
                } else if (state is NewestBooksSuccessState) {
                  return HomeBooksListView(books: state.booksList);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            verticalSpace(24),
            // Top of week Section
            HomeTitleRow(
              title: 'Top of the week books',
              onTap: () {},
            ),
            verticalSpace(16),
            // List top of weeks books
            BlocBuilder<TopOfTheWeekBooksCubit, TopOfTheWeekBooksState>(
              builder: (context, state) {
                if (state is TopOfTheWeekBooksLoadingState) {
                  return LoadingList();
                } else if (state is TopOfTheWeekBooksFailureState) {
                  return Center(
                    child: Text(
                      'there is an erro : ${state.erroMessage} ',
                    ),
                  );
                } else if (state is TopOfTheWeekBooksSuccessState) {
                  return HomeBooksListView(books: state.booksList);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
