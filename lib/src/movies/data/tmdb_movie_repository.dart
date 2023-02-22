import 'package:flutter_talk_app/src/movies/data/server_exception.dart';
import 'package:flutter_talk_app/src/movies/data/tmdb_response_model.dart';
import 'package:flutter_talk_app/src/movies/domain/movie.dart';
import 'package:flutter_talk_app/src/movies/domain/movie_repository.dart';
import 'package:http/http.dart' as http;

const popularMovieUrl = "https://api.themoviedb.org/3/movie/popular";

class TMDBMovieRepository implements MovieRepository {
  final http.Client client;

  TMDBMovieRepository(this.client);

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await client.get(Uri.parse(popularMovieUrl));

    if (response.statusCode == 200) {
      return movieResponseFromJson(response.body).results ?? List.empty();
    } else {
      throw ServerException();
    }
  }
}
