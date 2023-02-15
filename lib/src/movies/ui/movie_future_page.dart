import 'package:flutter/material.dart';
import 'package:flutter_talk_app/src/injection_container.dart';
import 'package:flutter_talk_app/src/movies/domain/movie.dart';
import 'package:flutter_talk_app/src/movies/domain/movie_repository.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/loading_widget.dart';
import 'package:flutter_talk_app/src/movies/ui/widgets/message_widget.dart';

class MovieFuturePage extends StatelessWidget {
  static const routeName = '/movies-future';

  const MovieFuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Using Future Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: serviceLocator<MovieRepository>().getPopularMovies(),
        builder: (context, data) {
          if (data.hasData) {
            final movies = data.data ?? List.empty();
            return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(movie.posterUrl),
                      title: Text(movie.title),
                      subtitle: Text(
                        movie.overview,
                        maxLines: 4,
                      ),
                    ),
                  );
                });
          } else if (data.hasError) {
            return const MessageWidget(message: 'Ha ocurrido un error');
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
