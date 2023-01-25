import 'package:flutter/material.dart';
import 'package:ny_times_task/src/features/articles/domain/entities/article.dart';
import 'package:ny_times_task/src/features/articles/presentation/pages/article_details_page.dart';

class ArticlesListWidget extends StatelessWidget {
  const ArticlesListWidget({super.key, required this.articles});
  final Article articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.numResults,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 120,
          child: ListTile(
              leading: SizedBox(
                  width: 100,
                  child: Text(articles.articlesList[index].section)),
              title: Text(
                articles.articlesList[index].title,
                maxLines: 2,
              ),
              subtitle: Text(
                articles.articlesList[index].resultAbstract,
                maxLines: 4,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ArticleDetailsPage(
                            article: articles.articlesList[index])));
              }),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
