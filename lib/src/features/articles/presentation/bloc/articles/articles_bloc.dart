import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ny_times_task/src/core/error/failures.dart';
import 'package:ny_times_task/src/core/strings/failures.dart';
import 'package:ny_times_task/src/features/articles/domain/usecases/get_articles_usecase.dart';

import '../../../domain/entities/article.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticlesUsecase getArticlesUsecase;
  ArticlesBloc({required this.getArticlesUsecase}) : super(ArticlesInitial()) {
    on<ArticlesEvent>((event, emit) async {
      if (event is GetArticles) {
        emit(LoadingArticlesState());
        final failureOrArticles = await getArticlesUsecase();
        emit(_mapFailureOrPostsToState(failureOrArticles));
      } else if (event is RefreshArticlesEvent) {
        emit(LoadingArticlesState());
        final failureOrArticles = await getArticlesUsecase();
        emit(_mapFailureOrPostsToState(failureOrArticles));
      }
    });
  }
}

ArticlesState _mapFailureOrPostsToState(Either<Failure, Article> either) {
  return either.fold(
      (failure) => ErrorArticlesState(message: _mapFailureToMessage(failure)),
      (articles) => LoadedArticlesState(articles: articles));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;

    default:
      return 'Unexpected Error , Please try again later';
  }
}
