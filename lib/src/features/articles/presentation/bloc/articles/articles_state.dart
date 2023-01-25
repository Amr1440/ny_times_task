part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class LoadingArticlesState extends ArticlesState {}

class LoadedArticlesState extends ArticlesState {
  final Article articles;

  const LoadedArticlesState({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ErrorArticlesState extends ArticlesState {
  final String message;

  const ErrorArticlesState({required this.message});

  @override
  List<Object> get props => [message];
}
