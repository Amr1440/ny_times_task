import 'dart:ffi';

import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

class Article extends Equatable {
   final String status;
    final int numResults;
    final List<ArticlesList> articlesList;

  const Article(
      {required this.status, required this.numResults, required this.articlesList});

  @override
  List<Object?> get props => [status, numResults, articlesList];
}
