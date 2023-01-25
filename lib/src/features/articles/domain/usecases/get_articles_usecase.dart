import 'package:dartz/dartz.dart';
import 'package:ny_times_task/src/core/error/failures.dart';
import 'package:ny_times_task/src/features/articles/domain/entities/article.dart';
import 'package:ny_times_task/src/features/articles/domain/repositories/articles_repository.dart';

class GetArticlesUsecase {
  final ArticlesRepository articlesRepository;

  GetArticlesUsecase(this.articlesRepository);

  Future<Either<Failure, Article>> call() async {
    return await articlesRepository.getArticles();
  }
}
