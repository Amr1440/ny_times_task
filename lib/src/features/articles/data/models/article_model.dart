
import 'dart:convert';

import 'package:ny_times_task/src/features/articles/domain/entities/article.dart';

class ArticleModel extends Article{
    ArticleModel({
        required super.status,
        required super.numResults,
        required super.articlesList,
    });



    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        status: json["status"],
        numResults: json["num_results"],
        articlesList: List<ArticlesList>.from(json["results"].map((x) => ArticlesList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "num_results": numResults,
        "results": List<dynamic>.from(articlesList.map((x) => x.toJson())),
    };
}

class ArticlesList {
    ArticlesList({
        required this.section,
        required this.type,
        required this.title,
        required this.resultAbstract,
    });

    String section;
    String type;
    String title;
    String resultAbstract;

    factory ArticlesList.fromJson(Map<String, dynamic> json) => ArticlesList(
        section: json["section"],
        type: json["type"],
        title: json["title"],
        resultAbstract: json["abstract"],
    );

    Map<String, dynamic> toJson() => {
        "section": section,
        "type": type,
        "title": title,
        "abstract": resultAbstract,
    };
}
