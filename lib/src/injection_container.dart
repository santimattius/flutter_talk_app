import 'package:flutter_talk_app/src/movies/data/authentication_interceptor.dart';
import 'package:flutter_talk_app/src/movies/data/tmdb_movie_repository.dart';
import 'package:flutter_talk_app/src/movies/domain/movie_repository.dart';
import 'package:flutter_talk_app/src/movies/ui/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator
      .registerFactory(() => MovieBloc(serviceLocator<MovieRepository>()));
  serviceLocator.registerFactory<MovieRepository>(
      () => TMDBMovieRepository(serviceLocator<http.Client>()));

  //Api Client
  serviceLocator.registerFactory<http.Client>(
      () => InterceptedClient.build(interceptors: [
            AuthenticationInterceptor(),
          ]));
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
