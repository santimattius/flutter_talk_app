import 'package:flutter_talk_app/src/movies/domain/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
}
