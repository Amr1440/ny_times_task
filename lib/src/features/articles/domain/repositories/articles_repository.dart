import 'package:dartz/dartz.dart';
import 'package:ny_times_task/src/core/error/failures.dart';
import 'package:ny_times_task/src/features/articles/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<Either<Failure, Article>> getArticles();
}
