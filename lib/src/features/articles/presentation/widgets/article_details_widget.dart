
import 'package:flutter/material.dart';
import 'package:ny_times_task/src/features/articles/data/models/article_model.dart';
import '../../domain/entities/article.dart';

class ArticleDetailsWidget extends StatelessWidget {
  final ArticlesList article;
  const ArticleDetailsWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            article.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            article.resultAbstract,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
