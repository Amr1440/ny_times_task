import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ny_times_task/src/core/error/exceptions.dart';
import 'package:ny_times_task/src/features/articles/data/models/article_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticleLocalDataSource {
  Future<ArticleModel> getCachedArticls();
  Future<Unit> cachedArticles(ArticleModel articleModels);
}

const CACHED_ARTICLES = 'CACHED_ARTICLES';

class ArticleLocalDataSourceImpl extends ArticleLocalDataSource {
  final SharedPreferences sharedPreferences;

  ArticleLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachedArticles(ArticleModel articleModels) {
    final articleModelsToJson = articleModels.toJson();
    sharedPreferences.setString(
        'CACHED_ARTICLES', json.encode(articleModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<ArticleModel> getCachedArticls() {
    final jsonString = sharedPreferences.getString(CACHED_ARTICLES);
    if (jsonString != null) {
      final decodeJsonData = json.decode(jsonString);
         final ArticleModel jsonToArticleModels = ArticleModel.fromJson(decodeJsonData);

      return Future.value(jsonToArticleModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
