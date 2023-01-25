import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_task/src/features/articles/presentation/bloc/articles/articles_bloc.dart';
import 'package:ny_times_task/src/features/articles/presentation/pages/articles_page.dart';
import 'src/core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ArticlesBloc>()..add(GetArticles()),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.lightBlue[800],
          ),
          debugShowCheckedModeBanner: false,
          title: 'NY times articles',
          home: ArticlePage()),
    );
  }
}
