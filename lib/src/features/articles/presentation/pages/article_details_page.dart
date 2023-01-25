import 'package:flutter/material.dart';
import 'package:ny_times_task/src/features/articles/data/models/article_model.dart';
import '../../domain/entities/article.dart';
import '../widgets/article_details_widget.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticlesList article;
  const ArticleDetailsPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text("Article Detail"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ArticleDetailsWidget(article: article),
      ),
    );
  }
}
