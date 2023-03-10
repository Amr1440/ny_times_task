part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class GetArticles extends ArticlesEvent {}

class RefreshArticlesEvent extends ArticlesEvent {}
