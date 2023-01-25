import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ny_times_task/src/core/network/network_info.dart';
import 'package:ny_times_task/src/features/articles/data/datasources/article_local_data_source.dart';
import 'package:ny_times_task/src/features/articles/data/repositories/articles_repository_impl.dart';
import 'package:ny_times_task/src/features/articles/domain/repositories/articles_repository.dart';
import 'package:ny_times_task/src/features/articles/domain/usecases/get_articles_usecase.dart';
import 'package:ny_times_task/src/features/articles/presentation/bloc/articles/articles_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/articles/data/datasources/article_remote_data_source.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Fearures - articles
  //bloc
  sl.registerFactory(() => ArticlesBloc(getArticlesUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetArticlesUsecase(sl()));

  //repository
  sl.registerLazySingleton<ArticlesRepository>(() => ArticlesRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //datasources
  sl.registerLazySingleton<ArticeRemoteDatatSource>(
      () => ArticleRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ArticleLocalDataSource>(
      () => ArticleLocalDataSourceImpl(sharedPreferences: sl()));

  //! core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharePrerences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharePrerences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
