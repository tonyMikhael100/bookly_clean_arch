import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repo/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchTopOfTheWeekBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchTopOfTheWeekBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void params]) async {
    return await homeRepo.fetchTopOfTheWeekBooks();
  }
}
