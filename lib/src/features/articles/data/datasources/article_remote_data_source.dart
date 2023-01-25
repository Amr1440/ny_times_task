import 'dart:convert';

import 'package:ny_times_task/src/core/constants/constant.dart';
import 'package:ny_times_task/src/core/error/exceptions.dart';
import 'package:ny_times_task/src/features/articles/data/models/article_model.dart';
import 'package:http/http.dart' as http;

abstract class ArticeRemoteDatatSource {
  Future<ArticleModel> getArticles();
}

class ArticleRemoteDataSourceImpl implements ArticeRemoteDatatSource {
  final http.Client client;

  ArticleRemoteDataSourceImpl({required this.client});
  @override
  Future<ArticleModel> getArticles() async {
final uri = Uri.parse(BASE_URL + GET_ARTICLES_ENDPOINT).replace(queryParameters: QUERY_PARAMATERS);
final response = await client.get(uri);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final ArticleModel articleModels = ArticleModel.fromJson(decodedJson);
      return articleModels;
    } else {
      throw ServerException();
    }
  }
}
