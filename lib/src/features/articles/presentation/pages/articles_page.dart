import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_task/src/features/articles/presentation/bloc/articles/articles_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/articles_list_widget.dart';
import '../widgets/message_display_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() => AppBar(title: Text('NY times Articles'));
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is LoadingArticlesState) {  
            return LoadingWidget();
          } else if (state is LoadedArticlesState) {
            return ArticlesListWidget(articles: state.articles);
          } else if (state is ErrorArticlesState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
