import 'package:ny_times_task/src/core/error/exceptions.dart';
import 'package:ny_times_task/src/core/network/network_info.dart';
import 'package:ny_times_task/src/features/articles/data/datasources/article_local_data_source.dart';
import 'package:ny_times_task/src/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:ny_times_task/src/features/articles/domain/entities/article.dart';
import 'package:ny_times_task/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ny_times_task/src/features/articles/domain/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticeRemoteDatatSource remoteDataSource;
  final ArticleLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ArticlesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Article>> getArticles() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticles = await remoteDataSource.getArticles();
        localDataSource.cachedArticles(remoteArticles);
        return right(remoteArticles);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedArticls();
        return right(localPosts);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }
}
